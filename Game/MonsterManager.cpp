/*
*
* Copyright (C) 2008-2017 Dimension Gamers <http://www.dimensiongamers.net>
*
* File: "MonsterMgr.cpp"
*
*/

MonsterManager::MonsterManager()
{
	this->SetLastUpdate(0);
}

MonsterManager::~MonsterManager()
{
	this->ClearItem();

	_monsterTemplate.clear();

	MAP_CLEAR(MonsterAIUnitMap::iterator, this->m_monster_ai_unit);
	MAP_CLEAR(MonsterAIElementMap::iterator, this->m_monster_ai_element);
	MAP_CLEAR(MonsterAIAutomataMap::iterator, this->m_monster_ai_automata);

	for ( MonsterSkillMap::iterator it = this->monster_skill_map.begin(); it != this->monster_skill_map.end(); ++it )
		it->second.clear();

	this->monster_skill_map.clear();

	for ( MonsterSkillSpecialMap::iterator it = this->monster_skill_special_map.begin(); it != this->monster_skill_special_map.end(); ++it )
	{
		LIST_CLEAR(MonsterSkillSpecialList::iterator, it->second);
	}

	MAP_CLEAR(MonsterMap::iterator, this->monster_map);

	for ( MonsterAIGroupMap::iterator it = this->monster_ai_group_map.begin(); it != this->monster_ai_group_map.end(); it++ )
	{
		LIST_CLEAR(MonsterAIGroupList::iterator, it->second);
	}

	for ( MonsterRespawnLocationMap::iterator i_list = this->m_monster_respawn_location_map.begin(); i_list != this->m_monster_respawn_location_map.end(); ++i_list )
	{
		LIST_CLEAR(MonsterRespawnLocationList::iterator, i_list->second);
	}

	this->m_monster_respawn_location_map.clear();

	for ( MonsterEquipmentMap::iterator i_list = this->m_monster_equipment_map.begin(); i_list != this->m_monster_equipment_map.end(); ++i_list )
	{
		LIST_CLEAR(MonsterEquipmentList::iterator, i_list->second);
	}

	this->m_monster_equipment_map.clear();

	
	this->monster_skill_special_map.clear();
	this->monster_ai_group_map.clear();

	CLEAR_MAP(_monsterEvent);
	MAP_CLEAR(MonsterRespawnMap::iterator, this->monster_respawn_map);

	LIST_CLEAR(MonsterExclusiveList::iterator, this->monster_exclusive_list);
}

void MonsterManager::LoadMonsterTemplate()
{
	sLog->outLoad(true, "Loading Monster Template...");

	auto result = GameServerDatabase.Query("SELECT * FROM monster_template");
	if (result)
	{
		_monsterTemplate.rehash((size_t)result->GetRowCount());
		do
		{
			FieldReader reader(result->Fetch());

			auto id = reader.GetUInt16();

			auto & data = _monsterTemplate[id];

			data.Id = id;
			data.Name = reader.GetString();
			data.Model = reader.GetUInt16();
			data.Size = reader.GetFloat();
			data.Type = reader.GetUInt8();
			data.Level = reader.GetInt16();

			for (int32 i = 0; i < POWER_MAX; ++i)
				data.Stat[i] = reader.GetInt32();

			data.DamageMin = reader.GetInt32();
			data.DamageMax = reader.GetInt32();
			data.CriticalDamageRate = reader.GetInt32();
			data.CriticalDamageAdd = reader.GetInt32();
			data.ExcellentDamageRate = reader.GetInt32();
			data.ExcellentDamageAdd = reader.GetInt32();
			data.AttackSuccessRate = reader.GetInt32();
			data.Defense = reader.GetInt32();
			data.DefenseSuccessRate = reader.GetInt32();
			data.MovementRange = reader.GetUInt32();
			data.MovementSpeed = reader.GetUInt32();
			data.AttackRange = reader.GetUInt32();
			data.AttackSpeed = reader.GetInt32();
			data.ViewRange = reader.GetUInt32();

			for (int32 i = 0; i < Element::MAX; ++i)
				data.Resistance[i] = reader.GetUInt8();

			data.RespawnTimeMin = reader.GetUInt32();
			data.RespawnTimeMax = reader.GetUInt32();
			data.ItemRate = reader.GetInt32();
			data.ZenRate = reader.GetInt32();
			data.ItemMaxLevel = reader.GetInt32();

			for (int32 i = 0; i < POWER_MAX; ++i)
			{
				data.StatRecovery[i] = reader.GetFloat();
				data.StatRecoveryTime[i] = reader.GetUInt32();
			}

			data.ScriptName = reader.GetString();

			data.ElementalAttribute = reader.GetUInt8();
			data.ElementalDefense = reader.GetInt32();
			data.ElementalDamageMin = reader.GetInt32();
			data.ElementalDamageMax = reader.GetInt32();
			data.ElementalAttackSuccessRate = reader.GetInt32();
			data.ElementalDefenseSuccessRate = reader.GetInt32();
			data.RadianceImmune = reader.GetUInt8();
			data.DebuffResistance = reader.GetInt32();
			data.DebuffDefense = reader.GetInt32();
			data.CriticalDamageResistance = reader.GetUInt8();
			data.ExcellentDamageResistance = reader.GetUInt8();
			data.DamageAbsrob = reader.GetUInt8();
			data.IsElite = reader.GetBool();
			data.IsCustom = reader.GetBool();
			data.ExpLevel = reader.GetUInt16();

			if (!sScriptAI->IsScriptAI(data.ScriptName))
			{
				sLog->outError(LOG_DEFAULT, "Wrong AI Script: %s", data.ScriptName.c_str());
				data.ScriptName.clear();
			}

			if (data.AttackRange > data.ViewRange)
				data.ViewRange = data.AttackRange;
		} while (result->NextRow());
	}

	sLog->outLoad(false, ">> Loaded %u monsters definitions", _monsterTemplate.size());
}

void MonsterManager::LoadMonsterItems()
{
	sLog->outLoad(true, "Loading Monster Items...");

	ClearItem();

	for (auto itr : _monsterTemplate)
	{
		auto const & monster_template = itr.second;

		CreateItem(monster_template.Level, monster_template.ItemMaxLevel);
	}

	sLog->outLoad(false, ">> Loaded monsters items");
}

MonsterTemplate const* MonsterManager::GetMonsterTemplate(uint16 id) const
{
	auto itr = _monsterTemplate.find(id);
	if (itr != this->_monsterTemplate.end())
		return &itr->second;
	else
		return nullptr;
}

monster * MonsterManager::GetMonsterData(uint16 index) const
{
	MonsterMap::const_iterator it = this->monster_map.find(index);

	if ( it != this->monster_map.end() )
	{
		return it->second;
	}
	else
	{
		return nullptr;
	}
}

void MonsterManager::LoadMonsterSkill()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Skill...");

	for ( MonsterSkillMap::iterator it = this->monster_skill_map.begin(); it != this->monster_skill_map.end(); ++it )
		it->second.clear();

	this->monster_skill_map.clear();

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_skill");

	if ( result )
	{
		do
		{

			Field* fields = result->Fetch();

			uint16 monster = fields[0].GetUInt16();
			uint16 skill = fields[1].GetUInt16();

			if ( !sSkillMgr->IsSkill(skill) )
				continue;
		
			this->monster_skill_map[monster].push_back(skill);

			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster skill", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterSkillSpecial()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Skill Special...");

	for ( MonsterSkillSpecialMap::iterator it = this->monster_skill_special_map.begin(); it != this->monster_skill_special_map.end(); it++ )
	{
		for ( MonsterSkillSpecialList::iterator it2 = it->second.begin(); it2 != it->second.end(); ++it2 )
			delete *it2;

		it->second.clear();
	}

	this->monster_skill_special_map.clear();
	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_skill_special");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_skill_special * add_skill = new monster_skill_special;

			add_skill->SetMonster(fields[0].GetUInt16());
			add_skill->SetType(fields[1].GetInt16());
			add_skill->SetSkill(fields[2].GetUInt16());

			if ( sSkillMgr->GetSkillSpecial(add_skill->GetSkill()) == nullptr )
			{
				delete add_skill;
				continue;
			}
		
			this->monster_skill_special_map[add_skill->GetMonster()].push_back(add_skill);
		
			count++;
		}
		while(result->NextRow());
	}
		
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster skill special", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterAIElement()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster AI Element...");

	MAP_CLEAR(MonsterAIElementMap::iterator, this->m_monster_ai_element);

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_ai_element");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_ai_element * ai_data = new monster_ai_element;
			ai_data->SetID(fields[0].GetUInt32());
			ai_data->SetName(fields[1].GetString());
			ai_data->SetState(fields[2].GetUInt8());
			ai_data->SetClass(fields[3].GetUInt8());
			ai_data->SetRate(fields[4].GetUInt8());
			ai_data->SetDelay(fields[5].GetUInt32());
			ai_data->SetTarget(fields[6].GetInt32());
			ai_data->SetX(fields[7].GetInt16());
			ai_data->SetY(fields[8].GetInt16());

			if ( ai_data->GetState() >= MONSTER_AI_ELEMENT_MAX )
			{
				delete ai_data;
				continue;
			}

			this->m_monster_ai_element[ai_data->GetID()] = ai_data;
			count++;
		}
		while(result->NextRow());
	}
		
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster ai element definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}
	
void MonsterManager::LoadMonsterAIAutomata()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster AI Automata...");

	MAP_CLEAR(MonsterAIAutomataMap::iterator, this->m_monster_ai_automata);

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_ai_automata");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			uint32 id = fields[0].GetUInt32();

			monster_ai_automata * ai_data = this->GetMonsterAIAutomata(id);

			if ( !ai_data )
			{
				ai_data = new monster_ai_automata;
				ai_data->SetID(id);
				this->m_monster_ai_automata[id] = ai_data;
			}

			std::string name(fields[1].GetString());
			uint8 priority = fields[2].GetUInt8();
			uint8 current_state = fields[3].GetUInt8();
			uint8 next_state = fields[4].GetUInt8();
			int32 transaction_type = fields[5].GetInt32();
			uint8 transaction_rate = fields[6].GetUInt8();
			int32 transaction_value_type = fields[7].GetInt32();
			int32 transition_value = fields[8].GetInt32();
			int32 delay = fields[9].GetInt32();

			if ( current_state >= MAX_AI_STATE )
				continue;

			if ( next_state >= MAX_AI_STATE )
				continue;

			if ( priority >= MAX_AI_PRIORITY )
				continue;

			monster_ai_state * ai_state = &ai_data->m_AIState[current_state][priority];

			ai_state->SetPriority(priority);
			ai_state->SetCurrentState(current_state);
			ai_state->SetNextState(next_state);
			ai_state->SetTransitionType(transaction_type);
			ai_state->SetTransitionRate(transaction_rate);
			ai_state->SetTransitionValueType(transaction_value_type);
			ai_state->SetTransitionValue(transition_value);
			ai_state->SetDelay(delay);
			ai_state->SetName(name);
			ai_data->m_AIStatCount[current_state]++;

			count++;
		}
		while(result->NextRow());
	}
		
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster ai automata definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}
	
void MonsterManager::LoadMonsterAIUnit()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster AI Unit...");

	MAP_CLEAR(MonsterAIUnitMap::iterator, this->m_monster_ai_unit);

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_ai_unit");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_ai_unit * ai_data = new monster_ai_unit;
			ai_data->SetID(fields[0].GetUInt32());
			ai_data->SetName(fields[1].GetString());
			ai_data->SetDelay(fields[2].GetUInt32());
			ai_data->SetAutomata(this->GetMonsterAIAutomata(fields[3].GetInt32()));

			ai_data->SetAIClass(0, this->GetMonsterAIElement(fields[4].GetInt32()));
			ai_data->SetAIClass(1, this->GetMonsterAIElement(fields[5].GetInt32()));
			ai_data->SetAIClass(2, this->GetMonsterAIElement(fields[6].GetInt32()));
			ai_data->SetAIClass(3, this->GetMonsterAIElement(fields[7].GetInt32()));
			ai_data->SetAIClass(4, this->GetMonsterAIElement(fields[8].GetInt32()));
			ai_data->SetAIClass(5, this->GetMonsterAIElement(fields[9].GetInt32()));
			ai_data->SetAIClass(6, this->GetMonsterAIElement(fields[10].GetInt32()));
			ai_data->SetAIClass(7, this->GetMonsterAIElement(fields[11].GetInt32()));

			this->m_monster_ai_unit[ai_data->GetID()] = ai_data;
			count++;
		}
		while(result->NextRow());
	}
		
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster ai unit definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterAIGroup()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster AI Group...");

	for ( MonsterAIGroupMap::iterator it = this->monster_ai_group_map.begin(); it != this->monster_ai_group_map.end(); it++ )
	{
		for ( MonsterAIGroupList::iterator it2 = it->second.begin(); it2 != it->second.end(); ++it2 )
			delete *it2;

		it->second.clear();
	}

	this->monster_ai_group_map.clear();
	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_ai_data");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			AIData * add_ai_data = new AIData;

			add_ai_data->SetGroup(fields[0].GetUInt32());
			add_ai_data->SetID(fields[1].GetUInt32());
	
			for ( uint8 i = 0; i < MONSTER_MAX_AI_ORDER; ++i )
			{
				add_ai_data->SetAIOrder(i, fields[2 + i].GetUInt32());
			}

			for ( uint8 i = 0; i < MONSTER_MAX_AI_ORDER; ++i )
			{
				add_ai_data->SetAITime(i, fields[6 + i].GetUInt32());
			}
		
			this->monster_ai_group_map[add_ai_data->GetGroup()].push_back(add_ai_data);

			count++;
		}
		while(result->NextRow());
	}
		
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster ai groups", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterRespawnLocation()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Respawn Location...");

	for ( MonsterRespawnLocationMap::iterator i_list = this->m_monster_respawn_location_map.begin(); i_list != this->m_monster_respawn_location_map.end(); ++i_list )
	{
		LIST_CLEAR(MonsterRespawnLocationList::iterator, i_list->second);
	}

	this->m_monster_respawn_location_map.clear();

	uint32 count = 0;

	PreparedStatement* stmt = GameServerDatabase.GetPreparedStatement(QUERY_SRVCFG_MONSTER_RESPAWN_LOCATION_SELECT);
	stmt->setUInt16(0, sGameServer->GetTransferServer());

	PreparedQueryResult result = GameServerDatabase.Query(stmt);

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_respawn_location * add_location = new monster_respawn_location;

			add_location->SetGroup(fields[1].GetUInt32());
			add_location->SetWorld(fields[2].GetUInt16());
			add_location->SetX1(fields[3].GetInt16());
			add_location->SetY1(fields[4].GetInt16());
			add_location->SetX2(fields[5].GetInt16());
			add_location->SetY2(fields[6].GetInt16());
			add_location->SetDirection(fields[7].GetInt8());
			add_location->SetInstance(fields[8].GetInt32());
			add_location->SetRate(fields[9].GetUInt8());

			this->m_monster_respawn_location_map[add_location->GetGroup()].push_back(add_location);
			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster respawn locations", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterEquipment()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Equipment...");

	for ( MonsterEquipmentMap::iterator i_list = this->m_monster_equipment_map.begin(); i_list != this->m_monster_equipment_map.end(); ++i_list )
	{
		LIST_CLEAR(MonsterEquipmentList::iterator, i_list->second);
	}

	this->m_monster_equipment_map.clear();

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_equipment");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_equipment * add_monster = new monster_equipment;

			uint16 monster = fields[0].GetUInt16();
			add_monster->slot.set(fields[1].GetUInt8());
			add_monster->type.set(fields[2].GetUInt8());
			add_monster->index.set(fields[3].GetUInt16());
			add_monster->level.set(fields[4].GetUInt8());
			add_monster->excellent_ancient.set(fields[5].GetUInt8());

			if ( this->GetMonsterTemplate(monster) == nullptr )
			{
				sLog->outError(LOG_DEFAULT, "LoadMonsterEquipment() Wrong Monster ID: %d", monster);
				delete add_monster;
				continue;
			}

			this->m_monster_equipment_map[monster].push_back(add_monster);
			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster equipment definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonster()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster...");

	MAP_CLEAR(MonsterMap::iterator, this->monster_map);

	uint32 count = 0;

	PreparedStatement* stmt = GameServerDatabase.GetPreparedStatement(QUERY_SRVCFG_MONSTER_SELECT);
	stmt->setUInt16(0, sGameServer->GetTransferServer());

	PreparedQueryResult result = GameServerDatabase.Query(stmt);

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster * add_monster = new monster;
			int32 loop = 1;

			add_monster->SetGUID(fields[loop++].GetUInt16());
			add_monster->SetID(fields[loop++].GetUInt16());
			add_monster->SetWorld(fields[loop++].GetUInt16());
			add_monster->SetX1(fields[loop++].GetInt16());
			add_monster->SetY1(fields[loop++].GetInt16());
			add_monster->SetX2(fields[loop++].GetInt16());
			add_monster->SetY2(fields[loop++].GetInt16());
			add_monster->SetDirection(fields[loop++].GetInt8());
			add_monster->SetSpawnDelay(fields[loop++].GetUInt32());
			add_monster->SetSpawnDistance(fields[loop++].GetUInt8());
			add_monster->SetRespawnTimeMin(fields[loop++].GetUInt32());
			add_monster->SetRespawnTimeMax(fields[loop++].GetUInt32());
			add_monster->SetRespawnID(fields[loop++].GetUInt32());
			add_monster->SetMoveDistance(fields[loop++].GetUInt8());
			add_monster->SetNpcFunction(fields[loop++].GetString());
			add_monster->SetItemBag(fields[loop++].GetString());
			add_monster->SetScriptName(fields[loop++].GetString());
			add_monster->SetElementalAttribute(fields[loop++].GetUInt8());

			if ( !sScriptAI->IsScriptAI(add_monster->GetScriptName()) )
			{
				sLog->outError(LOG_DEFAULT, "Wrong AI Script: %s", add_monster->GetScriptName().c_str());
				add_monster->ResetScriptName();
			}

			if ( add_monster->GetX1() > 255 )
				add_monster->SetX1(255);

			if ( add_monster->GetX1() < 0 )
				add_monster->SetX1(0);

			if ( add_monster->GetY1() > 255 )
				add_monster->SetY1(255);

			if ( add_monster->GetY1() < 0 )
				add_monster->SetY1(0);

			if ( add_monster->GetX2() > 255 )
				add_monster->SetX2(255);

			if ( add_monster->GetX2() < 0 )
				add_monster->SetX2(0);

			if ( add_monster->GetY2() > 255 )
				add_monster->SetY2(255);

			if ( add_monster->GetY2() < 0 )
				add_monster->SetY2(0);

			if ( add_monster->GetX2() < add_monster->GetX1() )
				add_monster->SetX2(add_monster->GetX1());

			if ( add_monster->GetY2() < add_monster->GetY1() )
				add_monster->SetY2(add_monster->GetY1());

			if ( add_monster->GetGUID() >= sObjectMgr->GetMaxMonsters() )
			{
				sLog->outError(LOG_DEFAULT, "High Monster GUID: %u", add_monster->GetGUID());
				delete add_monster;
				continue;
			}

			if ( this->GetMonsterTemplate(add_monster->GetID()) == nullptr )
			{
				sLog->outError(LOG_DEFAULT, "Wrong Monster GUID: %u / ID: %u", add_monster->GetGUID(), add_monster->GetID());
				delete add_monster;
				continue;
			}

			if ( !this->IsMonsterExclusive(add_monster->GetGUID()) )
			{
				delete add_monster;
				continue;
			}

			this->monster_map[add_monster->GetGUID()] = add_monster;
			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monsters", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonster(uint16 guid)
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster...");

	for ( MonsterMap::const_iterator it = this->monster_map.begin(); it != this->monster_map.end(); )
	{
		if ( it->first >= guid )
		{
			delete it->second;
			this->monster_map.erase(it++);
		}
		else
		{
			++it;
		}
	}

	uint32 count = 0;

	PreparedStatement* stmt = GameServerDatabase.GetPreparedStatement(QUERY_SRVCFG_MONSTER_SELECT_GUID);
	stmt->setUInt16(0, sGameServer->GetTransferServer());
	stmt->setUInt16(1, guid);

	PreparedQueryResult result = GameServerDatabase.Query(stmt);

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster * add_monster = new monster;
			int32 loop = 1;

			add_monster->SetGUID(fields[loop++].GetUInt16());
			add_monster->SetID(fields[loop++].GetUInt16());
			add_monster->SetWorld(fields[loop++].GetUInt16());
			add_monster->SetX1(fields[loop++].GetInt16());
			add_monster->SetY1(fields[loop++].GetInt16());
			add_monster->SetX2(fields[loop++].GetInt16());
			add_monster->SetY2(fields[loop++].GetInt16());
			add_monster->SetDirection(fields[loop++].GetInt8());
			add_monster->SetSpawnDelay(fields[loop++].GetUInt32());
			add_monster->SetSpawnDistance(fields[loop++].GetUInt8());
			add_monster->SetRespawnTimeMin(fields[loop++].GetUInt32());
			add_monster->SetRespawnTimeMax(fields[loop++].GetUInt32());
			add_monster->SetRespawnID(fields[loop++].GetUInt32());
			add_monster->SetMoveDistance(fields[loop++].GetUInt8());
			add_monster->SetNpcFunction(fields[loop++].GetString());
			add_monster->SetItemBag(fields[loop++].GetString());
			add_monster->SetScriptName(fields[loop++].GetString());
			add_monster->SetElementalAttribute(fields[loop++].GetUInt8());

			if ( !sScriptAI->IsScriptAI(add_monster->GetScriptName()) )
			{
				sLog->outError(LOG_DEFAULT, "Wrong AI Script: %s", add_monster->GetScriptName().c_str());
				add_monster->ResetScriptName();
			}

			if ( add_monster->GetX1() > 255 )
				add_monster->SetX1(255);

			if ( add_monster->GetX1() < 0 )
				add_monster->SetX1(0);

			if ( add_monster->GetY1() > 255 )
				add_monster->SetY1(255);

			if ( add_monster->GetY1() < 0 )
				add_monster->SetY1(0);

			if ( add_monster->GetX2() > 255 )
				add_monster->SetX2(255);

			if ( add_monster->GetX2() < 0 )
				add_monster->SetX2(0);

			if ( add_monster->GetY2() > 255 )
				add_monster->SetY2(255);

			if ( add_monster->GetY2() < 0 )
				add_monster->SetY2(0);

			if ( add_monster->GetX2() < add_monster->GetX1() )
				add_monster->SetX2(add_monster->GetX1());

			if ( add_monster->GetY2() < add_monster->GetY1() )
				add_monster->SetY2(add_monster->GetY1());

			if ( add_monster->GetGUID() >= sObjectMgr->GetMaxMonsters() )
			{
				sLog->outError(LOG_DEFAULT, "High Monster GUID: %u", add_monster->GetGUID());
				delete add_monster;
				continue;
			}

			if ( this->GetMonsterTemplate(add_monster->GetID()) == nullptr )
			{
				sLog->outError(LOG_DEFAULT, "Wrong Monster GUID: %u / ID: %u", add_monster->GetGUID(), add_monster->GetID());
				delete add_monster;
				continue;
			}

			if ( !this->IsMonsterExclusive(add_monster->GetGUID()) )
			{
				delete add_monster;
				continue;
			}

			this->monster_map[add_monster->GetGUID()] = add_monster;
			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monsters", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterEvent()
{
	sLog->outLoad(true, "Loading Monster Event...");

	CLEAR_MAP(_monsterEvent);

	auto result = GameServerDatabase.PQuery("SELECT * FROM monster_event WHERE monster_event.server = %u", sGameServer->GetTransferServer());
	if (result)
	{
		do
		{
			FieldReader reader(result->Fetch());
			reader.Skip(); ///- Skip server

			auto monster_id = reader.GetUInt16();
			auto map_id = reader.GetUInt16();
			auto x1 = reader.GetInt16();
			auto y1 = reader.GetInt16();
			auto x2 = reader.GetInt16();
			auto y2 = reader.GetInt16();
			auto direction = reader.GetUInt8();
			auto spawn_delay = reader.GetUInt32();
			auto spawn_distance = reader.GetUInt8();
			auto respawn_time = reader.GetUInt32();
			auto respawn_id = reader.GetUInt32();
			auto movement_distance = reader.GetUInt8();
			auto event_id = reader.GetUInt8();
			auto raw_data_1 = reader.GetInt32();
			auto raw_data_2 = reader.GetInt32();
			auto raw_data_3 = reader.GetInt32();
			auto raw_data_4 = reader.GetInt32();
			auto raw_data_5 = reader.GetInt32();
			auto npc_function = reader.GetString();
			auto item_bag = reader.GetString();
			auto script_name = reader.GetString();
			auto ai_group = reader.GetUInt32();
			auto ai_group_member = reader.GetUInt32();
			auto add_count = reader.GetInt32();

			for (int32 i = 0; i < add_count; ++i)
			{
				MonsterEvent * add_monster = new MonsterEvent;

				add_monster->MonsterId = monster_id;
				add_monster->MapId = map_id;
				add_monster->X1 = x1;
				add_monster->Y1 = y1;
				add_monster->X2 = x2;
				add_monster->Y2 = y2;
				add_monster->Direction = direction;
				add_monster->SpawnDelay = spawn_delay;
				add_monster->SpawnDistance = spawn_distance;
				add_monster->RespawnTime = respawn_time;
				add_monster->RespawnId = respawn_id;
				add_monster->MovementDistance = movement_distance;
				add_monster->EventId = event_id;
				add_monster->raw.data[0] = raw_data_1;
				add_monster->raw.data[1] = raw_data_2;
				add_monster->raw.data[2] = raw_data_3;
				add_monster->raw.data[3] = raw_data_4;
				add_monster->raw.data[4] = raw_data_5;
				add_monster->NpcFunction = npc_function;
				add_monster->ItemBag = item_bag;
				add_monster->ScriptName = script_name;
				add_monster->AIGroup = ai_group;
				add_monster->AIGroupMember = ai_group_member;

				if (!sScriptAI->IsScriptAI(add_monster->ScriptName))
				{
					sLog->outError(LOG_DEFAULT, "Wrong AI Script: %s", add_monster->ScriptName.c_str());
					add_monster->ScriptName.clear();
				}

				if (add_monster->X1 > 255)
					add_monster->X1 = 255;

				if (add_monster->X1 < 0)
					add_monster->X1 = 0;

				if (add_monster->Y1 > 255)
					add_monster->Y1 = 255;

				if (add_monster->Y1 < 0)
					add_monster->Y1 = 0;

				if (add_monster->X2 > 255)
					add_monster->X2 = 255;

				if (add_monster->X2 < 0)
					add_monster->X2 = 0;

				if (add_monster->Y2 > 255)
					add_monster->Y2 = 255;

				if (add_monster->Y2 < 0)
					add_monster->Y2 = 0;

				if (add_monster->X2 < add_monster->X1)
					add_monster->X2 = add_monster->X1;

				if (add_monster->Y2 < add_monster->Y1)
					add_monster->Y2 = add_monster->Y1;

				if (!GetMonsterTemplate(add_monster->MonsterId))
				{
					sLog->outError(LOG_DEFAULT, "Wrong Monster Event ID: %u", add_monster->MonsterId);
					delete add_monster;
					continue;
				}

				_monsterEvent.emplace(add_monster->EventId, add_monster);
			}
		} while (result->NextRow());
	}

	sLog->outLoad(false, ">> Loaded %u monster event definitions", _monsterEvent.size());
}

void MonsterManager::LoadMonsterRespawn()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Respawn...");

	MAP_CLEAR(MonsterRespawnMap::iterator, this->monster_respawn_map);

	uint32 count = 0;

	PreparedStatement* stmt = MuDatabase.GetPreparedStatement(QUERY_MUDATABASE_MONSTER_RESPAWN_SELECT);
	stmt->setUInt16(0, sGameServer->GetServerCode());

	PreparedQueryResult result = MuDatabase.Query(stmt);

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_respawn * add_monster = new monster_respawn;

			add_monster->SetGUID(fields[0].GetUInt16());
			add_monster->SetDate(fields[1].GetInt64());

			this->monster_respawn_map[add_monster->GetGUID()] = add_monster;
			count++;
		}
		while(result->NextRow());
	}

	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster respawn definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::LoadMonsterExclusive()
{
	sLog->outInfo(LOG_DEFAULT, "Loading Monster Exclusive...");

	LIST_CLEAR(MonsterExclusiveList::iterator, this->monster_exclusive_list);

	uint32 count = 0;

	QueryResult result = GameServerDatabase.Query("SELECT * FROM monster_exclusive");

	if ( result )
	{
		do
		{
			Field* fields = result->Fetch();

			monster_exclusive * add_monster = new monster_exclusive;

			add_monster->SetServer(fields[0].GetUInt16());
			add_monster->SetGUID(fields[1].GetUInt16());
			add_monster->SetAvailableServer(fields[2].GetUInt16());

			this->monster_exclusive_list.push_back(add_monster);
			count++;
		}
		while(result->NextRow());
	}
	
	sLog->outInfo(LOG_DEFAULT, ">> Loaded %u monster exclusive definitions", count);
	sLog->outInfo(LOG_DEFAULT, " ");
}

void MonsterManager::SpawnMonsters()
{
	for ( MonsterMap::const_iterator it = this->monster_map.begin(); it != this->monster_map.end(); ++it )
	{
		Monster* mMonster = MONSTER_ADD_CONTINUE(it->second);

		if ( !mMonster )
		{
			continue;
		}
		
		if ( !mMonster->GetWorld() )
		{
			mMonster->SetConnectStatus(CONNECT_STATUS_NONE);
			continue;
		}

		MonsterRespawnMap::const_iterator itr = this->monster_respawn_map.find(mMonster->GetEntry());

		if ( itr != this->monster_respawn_map.end() )
		{
			time_t current_time = time(nullptr);

			if ( itr->second->GetDate() > current_time )
			{
				mMonster->SetSpawnTime((itr->second->GetDate() - current_time) * IN_MILLISECONDS);
			}
		}

		mMonster->AddToWorld();
	}
}

bool MonsterManager::IsMonsterExclusive(uint16 guid) const
{
	bool success = true;
	bool founded = false;

	for ( MonsterExclusiveList::const_iterator it = this->monster_exclusive_list.begin(); it != this->monster_exclusive_list.end(); ++it )
	{
		if ( (*it) && (*it)->GetServer() == sGameServer->GetTransferServer() && (*it)->GetGUID() == guid )
		{
			success = false;

			if ( (*it)->GetAvailableServer() == sGameServer->GetServerCode() )
			{
				founded = true;
			}
		}
	}

	if ( founded )
	{
		success = true;
	}

	return success;
}

void MonsterManager::CreateItem(int32 level, int32 max_level)
{
	if ( level < 1 )
	{
		return;
	}

	ItemTemplateMap const& item_template_map = sItemMgr->GetItemMap();
	for ( ItemTemplateMap::const_iterator it = item_template_map.begin(); it != item_template_map.end(); ++it )
	{
		item_template const* item_info = it->second;

		if ( !item_info )
		{
			continue;
		}

		if ( !item_info->IsFlag(ITEM_FLAG_MONSTER_DROP) )
		{
			continue;
		}

		if ( !item_info->GetDropRate() )
		{
			continue;
		}
		
		uint8 type = item_info->GetType();
		uint16 index = item_info->GetIndex();

		int32 level_tmp = this->GenerateItemLevel(item_info, level);

		if ( level_tmp < 0 )
		{
			continue;
		}

		if ( type < 12 )
		{
			level_tmp = 0;
		}

		if ( level_tmp > max_level )
		{
			level_tmp = max_level;
		}

		this->InsertItem(level, ITEMGET(type, index), level_tmp);
	}
}

int32 MonsterManager::GenerateItemLevel(item_template const* item_info, int32 level)
{
	if ( item_info->GetLevel() == 0 )
	{
		return -1;
	}

	if ( item_info->GetLevel() >= (level - 18) && item_info->GetLevel() <= level ) // Rango de niveles
	{
		int32 ilevel = (level - item_info->GetLevel()) / 3;

		if ( item_info->GetType() == 13 )
		{
			// Rings y Pendants
			if ( item_info->GetIndex() == 8 || item_info->GetIndex() == 9 || item_info->GetIndex() == 12 || item_info->GetIndex() == 13 || item_info->GetIndex() == 20 || 
				 item_info->GetIndex() == 21 || item_info->GetIndex() == 22 || item_info->GetIndex() == 23 || item_info->GetIndex() == 24 || item_info->GetIndex() == 25 || 
				 item_info->GetIndex() == 26 || item_info->GetIndex() == 27 || item_info->GetIndex() == 28 )
			{
				if ( ilevel > 4 )
				{
					ilevel = 4;
				}
			}
		}

		return ilevel;
	}

	return -1;
}

bool MonsterManager::InsertItem(int32 level, uint16 item, uint8 item_level)
{
	MonsterItemList & item_list = this->m_monster_item_map[level];

	for ( MonsterItemList::const_iterator it = item_list.begin(); it != item_list.end(); ++it )
	{
		if ( (*it)->GetItem() == item && (*it)->GetLevel() == item_level )
		{
			return false;
		}
	}

	MonsterItem* pNewItem = new MonsterItem;
	pNewItem->SetItem(item);
	pNewItem->SetLevel(item_level);

	item_list.push_back(pNewItem);
	return true;
}

bool MonsterManager::GenerateItem(Item & item, int32 level, bool exe)
{
	if ( level < 1 )
		return false;

	RandomValue<MonsterItem const*> m_randomizer(nullptr);
	m_randomizer.SetTotalWeight(10000);
	
	MonsterItemMap::iterator i_list = this->m_monster_item_map.find(level);

	if ( i_list != this->m_monster_item_map.end() )
	{
		for ( MonsterItemList::iterator it = i_list->second.begin(); it != i_list->second.end(); ++it )
		{
			MonsterItem const* pItem = (*it);

			if ( !pItem )
			{
				continue;
			}

			item_template const* item_info = sItemMgr->GetItem(pItem->GetItem());

			if ( !item_info )
			{
				continue;
			}

			if ( !item_info->GetDropRate() )
			{
				continue;
			}

			if ( exe && !item_info->IsFlag(ITEM_FLAG_MONSTER_DROP_EXE) )
			{
				continue;
			}

			m_randomizer.AddValue(pItem, item_info->GetDropRate());
		}
	}

	MonsterItem const* pItem = m_randomizer.GetRandomValue(RANDOM_POOL_RATE);

	if ( pItem )
	{
		item.SetItem(pItem->GetItem());
		item.SetLevel(pItem->GetLevel());
		return true;
	}

	return false;
}
	
void MonsterManager::ClearItem()
{
	for ( MonsterItemMap::iterator i_list = this->m_monster_item_map.begin(); i_list != this->m_monster_item_map.end(); ++i_list )
	{
		for ( MonsterItemList::iterator it = i_list->second.begin(); it != i_list->second.end(); ++it )
		{
			delete *it;
		}

		i_list->second.clear();
	}

	this->m_monster_item_map.clear();
}

void MonsterManager::GenerateRespawnLocation(Monster* pMonster)
{
	monster_respawn_location const* pData = this->GetRandomRespawnLocation(pMonster);

	if ( !pData )
	{
		return;
	}

	pMonster->SetWorldId(pData->GetWorld());
	pMonster->SetDirection(pData->GetDirection());
	pMonster->SetInstance(pData->GetInstance());
	pMonster->SetBasicLocation(pData->GetX1(), pData->GetY1(), pData->GetX2(), pData->GetY2());
}

monster_respawn_location const* MonsterManager::GetRandomRespawnLocation(Monster* pMonster) const
{
	if ( !pMonster->GetRespawnID() )
		return nullptr;

	MonsterRespawnLocationMap::const_iterator it = this->m_monster_respawn_location_map.find(pMonster->GetRespawnID());

	if ( it == this->m_monster_respawn_location_map.end() )
		return nullptr;

	if ( it->second.empty() )
		return nullptr;

	RandomValue<monster_respawn_location const*> m_randomizer(nullptr);
	m_randomizer.SetTotalWeight(100);

	for ( MonsterRespawnLocationList::const_iterator data = it->second.begin(); data != it->second.end(); ++data )
	{
		m_randomizer.AddValue(*data, (*data)->GetRate());
	}

	return m_randomizer.GetRandomValue(RANDOM_POOL_RATE);
}

bool MonsterManager::TeleportToRandomLocation(Monster* pMonster, int32 attempts)
{
	do
	{
		monster_respawn_location const* pLocation = this->GetRandomRespawnLocation(pMonster);

		if ( pLocation )
		{
			if ( pLocation->GetWorld() != pMonster->GetWorldId() )
			{
				pMonster->UpdateLastLocation();

				pMonster->ClearPathData();
				pMonster->SetBasicLocation(pLocation->GetX1(), pLocation->GetY1(), pLocation->GetX2(), pLocation->GetY2());
				pMonster->SetWorldId(pLocation->GetWorld());

				pMonster->MakeRespawnLocation(false);

				pMonster->MagicAttackSend(ENTRY(pMonster), SKILL_TELEPORT);
				pMonster->ViewportClose();

				//pMonster->TeleportToLocation(pLocation->GetWorld(), pMonster->GetX(), pMonster->GetY(), pLocation->GetDirection(), pLocation->GetInstance());
				return true;
			}
		}
	}
	while ( attempts-- > 0 );

	return false;
}

void MonsterManager::BuildMonsterCustomData(Monster* pMonster, Player* pPlayer)
{
	if (!pMonster->GetMonsterTemplate()->IsCustom)
		return;

	VIEWPORT_MONSTER_CUSTOM_DATA pMsg;
	pMsg.index = pMonster->GetEntry();
	pMsg.type = pMonster->GetSendType();
	memcpy(pMsg.name, pMonster->GetName(), MAX_MONSTER_NAME_LENGTH);
	pMsg.size = pMonster->GetSize();
	
	MonsterEquipmentMap::const_iterator it = this->m_monster_equipment_map.find(pMonster->GetClass());

	if ( it != this->m_monster_equipment_map.end() )
	{
		for ( MonsterEquipmentList::const_iterator equipment = it->second.begin(); equipment != it->second.end(); ++equipment )
		{
			if ( (*equipment)->slot.get() < 12 )
			{
				pMsg.equipment[(*equipment)->slot.get()].item = ITEMGET((*equipment)->type.get(), (*equipment)->index.get());
				pMsg.equipment[(*equipment)->slot.get()].level = (*equipment)->level.get();
				pMsg.equipment[(*equipment)->slot.get()].excellent_ancient = (*equipment)->excellent_ancient.get();
			}
		}
	}

	if ( pPlayer )
	{
		pPlayer->sendPacket((uint8*)&pMsg, pMsg.h.get_size());
	}
	else
	{
		pMonster->sendPacket_viewport((uint8*)&pMsg, pMsg.h.get_size());
	}
}

uint16 MonsterManager::GetRandomSkillSpecial(Monster* pMonster, int16 type)
{
	MonsterSkillSpecialMap::const_iterator it = this->monster_skill_special_map.find(pMonster->GetClass());

	RandomValue<uint16> m_randomizer(0);

	if ( it != this->monster_skill_special_map.end() )
	{
		for ( MonsterSkillSpecialList::const_iterator itr = it->second.begin(); itr != it->second.end(); ++itr )
		{
			if ( (*itr)->GetType() == type )
			{
				m_randomizer.AddValue((*itr)->GetSkill(), 0);
			}
		}
	}

	return m_randomizer.GetRandomValue(RANDOM_POOL_RANDOM);
}

bool AllowItemDropInWorld(uint16 world, Item const& item)
{
	if ( item.GetItem() == JEWEL::BLESS ||
		 item.GetItem() == JEWEL::SOUL ||
		 item.GetItem() == JEWEL::CHAOS ||
		 item.GetItem() == JEWEL::LIFE ||
		 item.GetItem() == JEWEL::CREATION ||
		 item.GetItem() == JEWEL::DEATH ||
		 item.GetItem() == JEWEL::GUARDIAN )
	{
		if ( sCrywolf->GetOccupationState() == CRYWOLF_OCCUPATION_FAIL && sGameServer->IsCrywolfPenaltyApply() )
		{
			if ( Random(100) < sGameServer->GetCrywolfPenaltyJewelDrop() )
			{
				return false;
			}
		}
	}

	if (item.IsSocket())
	{
		if (world != WORLD_RAKLION && world != WORLD_RAKLION_BOSS)
		{
			return false;
		}
	}

	bool fail = false;

	if ( DS_MAP_RANGE(world) )
	{
		if ( item.GetItemType() >= 7 && item.GetItemType() <= 11 )
		{
			fail = item.GetItemIndex() == 17 || item.GetItemIndex() == 18 || item.GetItemIndex() == 19;
		}
		else if ( item.GetItemType() == 0 )
		{
			fail = item.GetItemIndex() == 17 || item.GetItemIndex() == 18;
		}
		else if ( item.GetItemType() == 12 )
		{
			fail = item.GetItemIndex() == 12 || item.GetItemIndex() == 13 || item.GetItemIndex() == 14 ||
				   item.GetItemIndex() == 16 || item.GetItemIndex() == 17 || item.GetItemIndex() == 18 ||
				   item.GetItemIndex() == 19;
		}
		else
		{
			fail = item.GetItem() == ITEMGET(4, 17) || item.GetItem() == ITEMGET(5, 9);
		}
	}
	else if ( DG_MAP_RANGE(world) )
	{
		if ( item.GetItem() == ITEMGET(14, 101) || item.GetItem() == ITEMGET(14, 110) )
		{
			fail = true;
		}
	}

	return fail ? RANDOM(10) == 0: true;
}