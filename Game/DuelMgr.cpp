/*
*
* Copyright (C) 2008-2017 Dimension Gamers <http://www.dimensiongamers.net>
*
* File: "DuelMgr.cpp"
*
*/

DuelRoom::DuelRoom()
{
	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		this->SetSpectator(i, nullptr);
	}

	this->GetDueler(0)->Reset();
	this->GetDueler(1)->Reset();
	this->SetUpdateTick(0);
	this->SetUpdateTime(0);
}

void DuelRoom::Clear()
{
	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		Player* pPlayer = this->GetSpectator(i);

		if ( this->IsInRoom(pPlayer) )
		{
			pPlayer->RemoveBuff(BUFF_DUEL_WATCHER);
			pPlayer->RemoveBuff(BUFF_TRANSPARENCY);
			pPlayer->TeleportToLocation(WORLD_VULCANUS);

			pPlayer->SetDuelSpectatorActive(false);
			pPlayer->SetDuelRoom(0);
		}
			
		this->SetSpectator(i, nullptr);
	}

	this->DuelEnd();

	for ( uint8 i = 0; i < 2; ++i )
	{
		Player* pPlayer = this->GetDueler(i)->GetPlayer();

		if ( this->IsInRoom(pPlayer) )
		{
			pPlayer->TeleportToLocation(WORLD_VULCANUS);

			pPlayer->SetDueling(false);
			pPlayer->SetDuelRoom(0);
		}
		
		this->GetDueler(i)->Reset();
	}
}

void DuelRoom::UpdateTime()
{
	if ( sGameServer->IsDuelClassic() )
	{
		return;
	}

	switch ( this->GetStatus() )
	{
	case DUEL_ROOM_EMPTY:
		{
		} break;

	case DUEL_ROOM_REQUESTED:	
		{ 
			this->ProcState_Requested(); 
		} break;

	case DUEL_ROOM_STARTED:		
		{ 
			this->ProcState_Started(); 
		} break;

	case DUEL_ROOM_FINISHED:	
		{ 
			this->ProcState_Finished(); 
		} break;
	}
}

void DuelRoom::StartTimer(uint32 time)
{
	this->SetUpdateTime(time);
	this->SetUpdateTick(GetTickCount());
}

void DuelRoom::SetDuelers(Player* pDueler01, Player* pDueler02)
{
	this->GetDueler(0)->SetPlayer(pDueler01);
	this->GetDueler(1)->SetPlayer(pDueler02);
}

void DuelRoom::SetState_Empty()
{
	this->SetStatus(DUEL_ROOM_EMPTY);
	this->Clear();
}

void DuelRoom::SetState_Requested()
{
	this->SetStatus(DUEL_ROOM_REQUESTED);
	this->StartTimer(sGameServer->GetDuelRoomStandByTime());
}
	
void DuelRoom::SetState_Started()
{
	this->SetStatus(DUEL_ROOM_STARTED);
	this->StartTimer(sGameServer->GetDuelDuration());
	this->MoveDuelersIn();
	this->CollectDuelersZen();

	sObjectMgr->SendEventNotification(NOTICE_GLOBAL, "Duel between %s and %s started on Room %d",
		NAME_SAFE(this->GetDueler(0)->GetPlayer()), NAME_SAFE(this->GetDueler(1)->GetPlayer()), this->GetRoomID() + 1);
}
	
void DuelRoom::SetState_Finished()
{
	this->SetStatus(DUEL_ROOM_FINISHED);
	this->StartTimer(10 * IN_MILLISECONDS);
}
	
void DuelRoom::ProcState_Requested()
{
	Player* Player01 = this->GetDueler(0)->GetPlayer();
	Player* Player02 = this->GetDueler(1)->GetPlayer();

	if ( !Player01 || !Player02 )
	{
		this->SetState_Empty();
		return;
	}

	if ( !Player01->IsPlaying() || !Player02->IsPlaying() )
	{
		this->SetState_Empty();
		return;
	}

	if ( !Player::InterfaceSharedCheck(Player01, Player02, InterfaceData::Duel, 0) )
	{
		this->SetState_Empty();
		return;
	}

	if ( Player01->IsDuelClassic() || Player02->IsDuelClassic() )
	{
		this->SetState_Empty();
		return;
	}

	if ( Player01->GetDuelRoom() != this->GetRoomID() ||
		 Player02->GetDuelRoom() != this->GetRoomID() )
	{
		this->SetState_Empty();
		return;
	}

	if ( this->TimePassed() )
		this->SetState_Empty();
}

void DuelRoom::ProcState_Started()
{
	this->UpdateSpectators();
	this->UpdateDuelers();
	this->SendScore();
	this->SendLifeBar();
	this->SendSpectatorList();

	if ( this->TimePassed() )
		this->FinishedOutOfTime();
}

void DuelRoom::ProcState_Finished()
{
	this->UpdateSpectators();

	if ( this->TimePassed() )
		this->SetState_Empty();
}

void DuelRoom::FinishedOutOfTime()
{
	this->DuelEnd();

	PLAYER_POINTER(this->GetDueler(0)->GetPlayer())->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);
	PLAYER_POINTER(this->GetDueler(1)->GetPlayer())->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);

	this->SetState_Finished();

	sObjectMgr->SendEventNotification(NOTICE_GLOBAL, "Duel between %s and %s on Room %d finished. Run out of time", 
		NAME_SAFE(this->GetDueler(0)->GetPlayer()), NAME_SAFE(this->GetDueler(1)->GetPlayer()), this->GetRoomID() + 1);
}

void DuelRoom::FinishedWinner(Player* winner, Player* looser)
{
	this->DuelFinished(winner->GetName(), looser->GetName());
	this->DuelEnd();

	this->SetState_Finished();

	sObjectMgr->SendEventNotification(NOTICE_GLOBAL, "Duel between %s and %s on Room %d finished. Final Score [%d - %d]", 
		NAME_SAFE(this->GetDueler(0)->GetPlayer()), NAME_SAFE(this->GetDueler(1)->GetPlayer()), this->GetRoomID() + 1, 
		this->GetDueler(0)->GetScore(), this->GetDueler(1)->GetScore());
}

void DuelRoom::FinishedLeftRoom(Player* desertor, bool cancelled)
{
	this->DuelEnd();

	PLAYER_POINTER(desertor)->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);

	this->SetState_Finished();

	if ( !cancelled )
	{
		sObjectMgr->SendEventNotification(NOTICE_GLOBAL, "Duel between %s and %s on Room %d finished. %s left the room", 
			NAME_SAFE(this->GetDueler(0)->GetPlayer()), NAME_SAFE(this->GetDueler(1)->GetPlayer()), this->GetRoomID() + 1, NAME_SAFE(desertor));
	}
	else
	{
		sObjectMgr->SendEventNotification(NOTICE_GLOBAL, "Duel between %s and %s on Room %d finished. %s cancelled duel", 
			NAME_SAFE(this->GetDueler(0)->GetPlayer()), NAME_SAFE(this->GetDueler(1)->GetPlayer()), this->GetRoomID() + 1, NAME_SAFE(desertor));
	}
}

void DuelRoom::UpdateSpectators()
{
	Player* pPlayer = nullptr;

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		pPlayer = this->GetSpectator(i);

		if ( !pPlayer )
			continue;

		if ( !pPlayer->Object::IsPlaying() )
		{
			pPlayer->RemoveBuff(BUFF_DUEL_WATCHER);
			pPlayer->RemoveBuff(BUFF_TRANSPARENCY);
			
			pPlayer->SetDuelSpectatorActive(false);
			pPlayer->SetDuelRoom(0);

			this->SetSpectator(i, nullptr);
			continue;
		}

		//if ( pPlayer->GetRegenStatus() != REGEN_NONE )
		//	continue;

		if ( pPlayer->GetWorldId() != WORLD_VULCANUS_ROOM )
		{
			pPlayer->RemoveBuff(BUFF_DUEL_WATCHER);
			pPlayer->RemoveBuff(BUFF_TRANSPARENCY);
			
			pPlayer->SetDuelSpectatorActive(false);
			pPlayer->SetDuelRoom(0);

			this->SetSpectator(i, nullptr);
			continue;
		}
	}
}

void DuelRoom::UpdateDuelers()
{
	for ( uint8 i = 0; i < 2; ++i )
	{
		Player* pPlayer = this->GetDueler(i)->GetPlayer();

		if ( !pPlayer )
		{
			this->FinishedLeftRoom(pPlayer, false);
			return;
		}

		if ( !pPlayer->IsPlaying() )
		{
			this->FinishedLeftRoom(pPlayer, false);
			return;
		}

		if ( pPlayer->GetWorldId() != WORLD_VULCANUS_ROOM )
		{
			pPlayer->SetDueling(false);
			pPlayer->SetDuelRoom(0);

			this->FinishedLeftRoom(pPlayer, false);
			return;
		}

		if ( this->GetDueler(i)->IsCancelled() )
		{
			pPlayer->SetDueling(false);
			pPlayer->SetDuelRoom(0);

			this->FinishedLeftRoom(pPlayer, true);
			return;
		}
	}
}

void DuelRoom::CollectDuelersZen()
{
	Player* pPlayer = nullptr;

	for ( uint8 i = 0; i < 2; ++i )
	{
		if ( pPlayer = this->GetDueler(i)->GetPlayer() )
			pPlayer->MoneyReduce(sGameServer->GetDuelRequiredZen());
	}
}

void DuelRoom::MoveDuelersIn()
{
	Player* pPlayer = nullptr;

	for ( uint8 i = 0; i < 2; ++i )
	{
		pPlayer = this->GetDueler(i)->GetPlayer();

		if ( !pPlayer )
		{
			this->SetState_Finished();
			return;
		}

		if ( !pPlayer->MoveToGate(g_DuelRoomInfo[this->GetRoomID()].dueler_gate[i]) )
		{
			this->SetState_Finished();
			return;
		}

		if ( sGameServer->GetDuelRoundStandby() > 0 )
		{
			pPlayer->SetAttackStandby(sGameServer->GetDuelRoundStandby());
		}

		pPlayer->ClearAllBuff(0);
	}
}

void DuelRoom::AddSpectator(Player* pPlayer)
{
	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		if ( this->GetSpectator(i) )
			continue;

		pPlayer->GetInterfaceState()->Reset();

		if ( !pPlayer->MoveToGate(g_DuelRoomInfo[this->GetRoomID()].watcher_gate) )
		{
			pPlayer->SendNotice(CUSTOM_MESSAGE_ID_RED, "Error while trying to move to duel room.");
			return;
		}

		this->SetSpectator(i, pPlayer);

		pPlayer->SetDuelSpectatorActive(true);
		pPlayer->SetDuelRoom(this->GetRoomID());

		pPlayer->AddBuff(BUFF_DUEL_WATCHER, 0, BUFF_FLAG_CONSTANT, pPlayer);
		pPlayer->AddBuff(BUFF_TRANSPARENCY, 0, BUFF_FLAG_CONSTANT, pPlayer);

		this->SendLifeBarInit(pPlayer);
		this->SendSpectatorAdd(pPlayer);
		return;
	}
	
	this->SendLifeBarError(pPlayer, 0x1B);
}

void DuelRoom::DelSpectator(Player* pPlayer)
{
	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		if ( this->GetSpectator(i) != pPlayer )
			continue;

		pPlayer->TeleportToLocation(WORLD_VULCANUS);
		this->SetSpectator(i, nullptr);
		this->SendSpectatorDel(pPlayer);
		pPlayer->RemoveBuff(BUFF_DUEL_WATCHER);
		pPlayer->RemoveBuff(BUFF_TRANSPARENCY);

		pPlayer->SetDuelSpectatorActive(false);
		pPlayer->SetDuelRoom(0);
	}
}

void DuelRoom::SendScore()
{
	Player* Player01 = this->GetDueler(0)->GetPlayer();
	Player* Player02 = this->GetDueler(1)->GetPlayer();

	if ( !Player01 || !Player02 )
		return;

	DUEL_SCORE pMsg(Player01->GetEntry(), Player02->GetEntry(), this->GetDueler(0)->GetScore(), this->GetDueler(1)->GetScore());

	Player01->sendPacket(MAKE_PCT(pMsg));
	Player02->sendPacket(MAKE_PCT(pMsg));

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}

void DuelRoom::SendLifeBarInit(Player* pPlayer)
{
	if ( !pPlayer )
	{
		return;
	}

	Player* Player01 = this->GetDueler(0)->GetPlayer();
	Player* Player02 = this->GetDueler(1)->GetPlayer();

	if ( !Player01 || !Player02 )
		return;

	DUEL_LIFE_BAR_INIT pMsg(0, this->GetRoomID(), Player01->GetName(), Player02->GetName(), Player01->GetEntry(), Player02->GetEntry());
	pPlayer->sendPacket(MAKE_PCT(pMsg));
}

void DuelRoom::SendLifeBarError(Player* pPlayer, uint8 result)
{
	if ( !pPlayer )
	{
		return;
	}

	DUEL_LIFE_BAR_INIT pMsg(result, this->GetRoomID(), pPlayer->GetName(), pPlayer->GetName(), pPlayer->GetEntry(), pPlayer->GetEntry());
	pPlayer->sendPacket(MAKE_PCT(pMsg));
}
	
void DuelRoom::SendLifeBar()
{
	Player* Player01 = this->GetDueler(0)->GetPlayer();
	Player* Player02 = this->GetDueler(1)->GetPlayer();

	if ( !Player01 || !Player02 )
		return;

	DUEL_LIFE_BAR_UPDATE pMsg(Player01->GetEntry(), Player02->GetEntry(),
							  Player01->PowerGetPercent(POWER_LIFE),Player02->PowerGetPercent(POWER_LIFE),
							  Player01->PowerGetPercent(POWER_SHIELD),Player02->PowerGetPercent(POWER_SHIELD));

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}

void DuelRoom::SendSpectatorAdd(Player* pPlayer)
{
	DUEL_SPECTATOR_ADD pMsg(pPlayer->GetName());

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}
	
void DuelRoom::SendSpectatorDel(Player* pPlayer)
{
	DUEL_SPECTATOR_DEL pMsg(pPlayer->GetName());

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}
	
void DuelRoom::SendSpectatorList()
{
	DUEL_SPECTATOR_LIST pMsg;
	Player* pPlayer = nullptr;

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		pPlayer = this->GetSpectator(i);

		if ( !pPlayer )
			continue;

		memcpy(pMsg.name[pMsg.count], pPlayer->GetName(), MAX_CHARACTER_LENGTH);
		pMsg.count++;
	}

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}

bool DuelRoom::IsInRoom(Player* pPlayer)
{
	if ( !pPlayer || !pPlayer->IsPlaying() )
		return false;

	if ( pPlayer->GetWorldId() != WORLD_VULCANUS_ROOM )
		return false;

	return true;
}

uint8 DuelRoom::SpectatorFreeSlot()
{
	if ( this->GetStatus() != DUEL_ROOM_STARTED )
		return 0;

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		if ( this->GetSpectator(i) )
			continue;

		return 1;
	}

	return 0;
}

void DuelRoom::UpdateScore(Player* pPlayer)
{
	Player* Player01 = this->GetDueler(0)->GetPlayer();
	Player* Player02 = this->GetDueler(1)->GetPlayer();

	if ( !Player01 || !Player02 )
		return;

	for ( uint8 i = 0; i < 2; ++i )
	{
		if ( this->GetDueler(i)->GetPlayer() == pPlayer )
		{
			this->GetDueler(i)->IncreaseScore(1);
		}
	}

	this->SendScore();

	if ( this->GetDueler(0)->GetScore() >= DUELING_SCORE )
	{
		Player01->FireworksSend();
		Player01->UpdateStatistic(STATISTIC_DUEL_WINNED, 1);
		Player02->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);
		this->FinishedWinner(Player01, Player02);
	}
	else if ( this->GetDueler(1)->GetScore() >= DUELING_SCORE )
	{
		Player02->FireworksSend();
		Player02->UpdateStatistic(STATISTIC_DUEL_WINNED, 1);
		Player01->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);
		this->FinishedWinner(Player02, Player01);
	}
}

void DuelRoom::DuelFinished(const char * winner, const char * looser)
{
	DUEL_END_WINNER pMsg(winner, looser);

	PLAYER_POINTER(this->GetDueler(0)->GetPlayer())->sendPacket(MAKE_PCT(pMsg));
	PLAYER_POINTER(this->GetDueler(1)->GetPlayer())->sendPacket(MAKE_PCT(pMsg));

	for ( uint8 i = 0; i < MAX_DUEL_SPECTATORS; ++i )
	{
		PLAYER_POINTER(this->GetSpectator(i))->sendPacket(MAKE_PCT(pMsg));
	}
}

void DuelRoom::DuelEnd(uint8 result)
{
	DUEL_END pMsg(result);

	if ( Player* pPlayer = this->GetDueler(1)->GetPlayer() )
	{
		pMsg.SetIndex(pPlayer->GetEntry());
		memcpy(pMsg.name, pPlayer->GetName(), MAX_CHARACTER_LENGTH);
	}

	PLAYER_POINTER(this->GetDueler(0)->GetPlayer())->sendPacket(MAKE_PCT(pMsg));

	if ( Player* pPlayer = this->GetDueler(0)->GetPlayer() )
	{
		pMsg.SetIndex(pPlayer->GetEntry());
		memcpy(pMsg.name, pPlayer->GetName(), MAX_CHARACTER_LENGTH);
	}

	PLAYER_POINTER(this->GetDueler(1)->GetPlayer())->sendPacket(MAKE_PCT(pMsg));
}

DuelMgr::DuelMgr()
{
	for ( uint8 i = 0; i < MAX_DUEL_ROOM; ++i )
	{
		this->GetRoom(i)->SetState_Empty();
		this->GetRoom(i)->SetRoomID(i);
	}
}

void DuelMgr::UpdateTime()
{
	for ( uint8 i = 0; i < MAX_DUEL_ROOM; ++i )
		this->GetRoom(i)->UpdateTime();
}

DuelRoom * DuelMgr::GetFreeRoom()
{
	for ( uint8 i = 0; i < MAX_DUEL_ROOM; ++i )
	{
		if ( this->GetRoom(i)->GetStatus() != DUEL_ROOM_EMPTY )
			continue;

		return this->GetRoom(i);
	}

	return nullptr;
}

void DuelMgr::SendDuelRoomStatus(Player* mPlayer)
{
	DUEL_STATUS_HEAD pMsg;

	for ( uint8 i = 0; i < MAX_DUEL_ROOM; ++i )
	{
		if ( this->GetRoom(i)->GetStatus() != DUEL_ROOM_STARTED )
			 continue;

		if ( !this->GetRoom(i)->GetDueler(0)->GetPlayer() || !this->GetRoom(i)->GetDueler(1)->GetPlayer() )
			continue;

		pMsg.room[i].open = this->GetRoom(i)->SpectatorFreeSlot();
		pMsg.room[i].running = 1;

		memcpy(pMsg.room[i].name1, this->GetRoom(i)->GetDueler(0)->GetPlayer()->GetName(), MAX_CHARACTER_LENGTH);
		memcpy(pMsg.room[i].name2, this->GetRoom(i)->GetDueler(1)->GetPlayer()->GetName(), MAX_CHARACTER_LENGTH);
	}

	mPlayer->sendPacket(MAKE_PCT(pMsg));
}

void DuelMgr::GenerateRespawn(Player* pPlayer, uint16 & world, int16 & x, int16 & y)
{
	if ( !pPlayer->IsDuelClassic() )
	{
		if ( world == WORLD_VULCANUS_ROOM && DUEL_ROOM_RANGE(pPlayer->GetDuelRoom()) )
		{
			DuelRoom* pRoom = this->GetRoom(pPlayer->GetDuelRoom());

			for ( uint8 i = 0; i < 2; ++i )
			{
				if ( pRoom->GetDueler(i)->GetPlayer() == pPlayer )
				{
					pPlayer->GetValidCoordinates(g_DuelRoomInfo[pPlayer->GetDuelRoom()].dueler_gate[i], world, x, y);
				}
				else
				{
					pRoom->GetDueler(i)->GetPlayer()->MoveToGate(g_DuelRoomInfo[pPlayer->GetDuelRoom()].dueler_gate[i]);

					for ( uint8 h = 0; h < POWER_MAX; ++h )
					{
						pRoom->GetDueler(i)->GetPlayer()->PowerSet(h, pRoom->GetDueler(i)->GetPlayer()->PowerGetTotal(h), true);
					}
				}
			}

			return;
		}
	}

	pPlayer->GenerateRandomLocation(pPlayer->GetWorld(), x, y, 18, WORLD_ATTRIBUTE_LOCK_1 | WORLD_ATTRIBUTE_LOCK_2, pPlayer->GetInstance());
}

void DuelMgr::ClassicScore(Player* pPlayer01, Player* pPlayer02)
{
	if ( !pPlayer01 || !pPlayer02 )
	{
		return;
	}

	pPlayer01->IncreaseDuelScore(1);

	this->ClassicSendScore(pPlayer01, pPlayer02);

	if ( pPlayer01->GetDuelScore() >= DUELING_SCORE )
	{
		pPlayer01->FireworksSend();
		pPlayer01->UpdateStatistic(STATISTIC_DUEL_WINNED, 1);
		pPlayer02->UpdateStatistic(STATISTIC_DUEL_LOOSED, 1);
		this->ClassicResult(pPlayer01, pPlayer02);
		this->ClassicEnd(pPlayer01, pPlayer02, 0);

		pPlayer01->SetDueling(false);
		pPlayer01->SetDuelScore(0);
		pPlayer01->SetDuelClassic(false);
		pPlayer01->SetDuelTarget(nullptr);

		pPlayer02->SetDueling(false);
		pPlayer02->SetDuelScore(0);
		pPlayer02->SetDuelClassic(false);
		pPlayer02->SetDuelTarget(nullptr);
	}
}

void DuelMgr::ClassicEnd(Player* pPlayer01, Player* pPlayer02, uint8 result)
{
	DUEL_END pMsg(result);

	if ( pPlayer02 )
	{
		pMsg.SetIndex(pPlayer02->GetEntry());
		memcpy(pMsg.name, pPlayer02->GetName(), MAX_CHARACTER_LENGTH);
	}

	PLAYER_POINTER(pPlayer01)->sendPacket(MAKE_PCT(pMsg));

	if ( pPlayer01 )
	{
		pMsg.SetIndex(pPlayer01->GetEntry());
		memcpy(pMsg.name, pPlayer01->GetName(), MAX_CHARACTER_LENGTH);
	}

	PLAYER_POINTER(pPlayer02)->sendPacket(MAKE_PCT(pMsg));
}
	
void DuelMgr::ClassicResult(Player* pWinner, Player* pLooser)
{
	if ( !pWinner || !pLooser )
	{
		return;
	}

	DUEL_END_WINNER pMsg(pWinner->GetName(), pLooser->GetName());

	PLAYER_POINTER(pWinner)->sendPacket(MAKE_PCT(pMsg));
	PLAYER_POINTER(pLooser)->sendPacket(MAKE_PCT(pMsg));
}

void DuelMgr::ClassicSendScore(Player* pPlayer01, Player* pPlayer02)
{
	if ( !pPlayer01 || !pPlayer02 )
	{
		return;
	}

	DUEL_SCORE pMsg(pPlayer01->GetEntry(), pPlayer02->GetEntry(), pPlayer01->GetDuelScore(), pPlayer02->GetDuelScore());

	pPlayer01->sendPacket(MAKE_PCT(pMsg));
	pPlayer02->sendPacket(MAKE_PCT(pMsg));
}

void DuelMgr::ClassicUpdate(Player* pPlayer)
{
	if ( !pPlayer )
	{
		return;
	}

	Player* pTarget = pPlayer->GetDuelTarget();

	if ( !pTarget )
	{
		pPlayer->SetDueling(false);
		pPlayer->SetDuelClassic(false);
		this->ClassicEnd(pPlayer, pTarget, 0);
		return;
	}

	if ( !pTarget->IsPlaying() )
	{
		this->ClassicCancel(pPlayer, pTarget);
		return;
	}

	if ( pPlayer->GetWorldId() != pPlayer->GetDuelWorld() )
	{
		this->ClassicCancel(pPlayer, pTarget);
		return;
	}

	if ( !pPlayer->IsPlaying() )
	{
		this->ClassicCancel(pPlayer, pTarget);
		return;
	}

	if ( pPlayer->GetTimer(PLAYER_TIMER_DUEL_TIME)->Elapsed(sGameServer->GetDuelDuration()) )
	{
		this->ClassicCancel(pPlayer, pTarget);
		return;
	}
}

void DuelMgr::ClassicCancel(Player* pPlayer01, Player* pPlayer02)
{
	this->ClassicEnd(pPlayer01, pPlayer02, 0);

	if ( pPlayer01 )
	{
		pPlayer01->SetDueling(false);
		pPlayer01->SetDuelClassic(false);
		pPlayer01->SetDuelTarget(nullptr);
	}

	if ( pPlayer02 )
	{
		pPlayer02->SetDueling(false);
		pPlayer02->SetDuelClassic(false);
		pPlayer02->SetDuelTarget(nullptr);
	}
}