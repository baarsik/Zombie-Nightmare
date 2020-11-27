#if defined _zn_util
  #endinput
#endif
#define _zn_util

#include <cstrike>
#include <fakemeta>
#include <hamsandwich>

#define OFFSET_LINUX 5
#define OFFSET_LINUX_WEAPONS 4

// CS Player PData Offsets (win32)
#define PDATA_SAFE 2
#define OFFSET_PAINSHOCK 108
#define OFFSET_CSTEAMS 114
#define OFFSET_CSMONEY 115
#define OFFSET_CSMENUCODE 205
#define OFFSET_FLASHLIGHT_BATTERY 244
#define OFFSET_CSDEATHS 444
#define OFFSET_MODELINDEX 491
#define OFFSET_NEXTATTACK 83

// CS Player CBase Offsets (win32)
#define OFFSET_ACTIVE_ITEM 373 
#define OFFSET_WEAPONOWNER 41

#define PRIMARY_WEAPONS_BIT_SUM (1<<CSW_SCOUT)|(1<<CSW_XM1014)|(1<<CSW_MAC10)|(1<<CSW_AUG)|(1<<CSW_UMP45)|(1<<CSW_SG550)|(1<<CSW_GALIL)|(1<<CSW_FAMAS)|(1<<CSW_AWP)|(1<<CSW_MP5NAVY)|(1<<CSW_M249)|(1<<CSW_M3)|(1<<CSW_M4A1)|(1<<CSW_TMP)|(1<<CSW_G3SG1)|(1<<CSW_SG552)|(1<<CSW_AK47)|(1<<CSW_P90)
#define SECONDARY_WEAPONS_BIT_SUM (1<<CSW_P228)|(1<<CSW_ELITE)|(1<<CSW_FIVESEVEN)|(1<<CSW_USP)|(1<<CSW_GLOCK18)|(1<<CSW_DEAGLE)

// HACK: pev_ field used to store additional ammo on weapons
#define PEV_ADDITIONAL_AMMO pev_iuser1

// Set entity's rendering type (from fakemeta_util)
stock fm_set_rendering(entity, fx = kRenderFxNone, r = 255, g = 255, b = 255, render = kRenderNormal, amount = 16)
{
	static Float:color[3];
	color[0] = float(r);
	color[1] = float(g);
	color[2] = float(b);
	set_pev(entity, pev_renderfx, fx);
	set_pev(entity, pev_rendercolor, color);
	set_pev(entity, pev_rendermode, render);
	set_pev(entity, pev_renderamt, float(amount));
}

// Get entity's speed (from fakemeta_util)
stock fm_get_speed(entity)
{
	static Float:velocity[3];
	pev(entity, pev_velocity, velocity);
	return floatround(vector_length(velocity));
}

// Get entity's aim origins (from fakemeta_util)
stock fm_get_aim_origin(id, Float:origin[3])
{
	static Float:origin1F[3], Float:origin2F[3];
	pev(id, pev_origin, origin1F);
	pev(id, pev_view_ofs, origin2F);
	xs_vec_add(origin1F, origin2F, origin1F);
	pev(id, pev_v_angle, origin2F);
	engfunc(EngFunc_MakeVectors, origin2F);
	global_get(glb_v_forward, origin2F);
	xs_vec_mul_scalar(origin2F, 9999.0, origin2F);
	xs_vec_add(origin1F, origin2F, origin2F);
	engfunc(EngFunc_TraceLine, origin1F, origin2F, 0, id, 0);
	get_tr2(0, TR_vecEndPos, origin);
}

// Find entity by its owner
stock fm_find_ent_by_owner(owner, const classname[])
{
	static entity; entity = -1;
	while((entity = engfunc(EngFunc_FindEntityByString, entity, "classname", classname)) && pev(entity, pev_owner) != owner) { /* keep looping */ }
	return entity;
}

// Set player's health (from fakemeta_util)
stock fm_set_user_health(id, health)
{
	(health > 0) ? set_pev(id, pev_health, float(health)) : dllfunc(DLLFunc_ClientKill, id);
}

// Give an item to a player (from fakemeta_util)
stock fm_give_item(id, const item[])
{
	static ent;
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, item));
	if (!pev_valid(ent)) return;
	
	static Float:originF[3];
	pev(id, pev_origin, originF);
	set_pev(ent, pev_origin, originF);
	set_pev(ent, pev_spawnflags, pev(ent, pev_spawnflags) | SF_NORESPAWN);
	dllfunc(DLLFunc_Spawn, ent);
	static save;
	save = pev(ent, pev_solid);
	dllfunc(DLLFunc_Touch, ent, id);
	if (pev(ent, pev_solid) != save)
		return;
	
	engfunc(EngFunc_RemoveEntity, ent);
}

// Strip user weapons (from fakemeta_util)
stock fm_strip_user_weapons(id)
{
	static ent;
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "player_weaponstrip"));
	if (!pev_valid(ent)) return;
	
	dllfunc(DLLFunc_Spawn, ent);
	dllfunc(DLLFunc_Use, ent, id);
	engfunc(EngFunc_RemoveEntity, ent);
}

// Drop primary/secondary weapons
stock drop_weapons(id, dropwhat)
{
	static weapons[32], num, i, weaponid;
	num = 0; // reset passed weapons count (bugfix)
	get_user_weapons(id, weapons, num);
	for (i = 0; i < num; i++)
	{
		weaponid = weapons[i];
		if ((dropwhat == 1 && ((1<<weaponid) & PRIMARY_WEAPONS_BIT_SUM)) || (dropwhat == 2 && ((1<<weaponid) & SECONDARY_WEAPONS_BIT_SUM)))
		{
			static wname[32], weapon_ent;
			get_weaponname(weaponid, wname, charsmax(wname));
			weapon_ent = fm_find_ent_by_owner(id, wname);
			set_pev(weapon_ent, PEV_ADDITIONAL_AMMO, cs_get_user_bpammo(id, weaponid));
			engclient_cmd(id, "drop", wname);
			cs_set_user_bpammo(id, weaponid, 0);
		}
	}
}

// Stock by (probably) Twilight Suzuka -counts number of chars in a string
stock str_count(const str[], searchchar)
{
	new count, i, len = strlen(str);
	for (i = 0; i <= len; i++)
	{
		if(str[i] == searchchar)
			count++;
	}
	return count;
}

// Checks if a space is vacant (credits to VEN)
stock is_hull_vacant(Float:origin[3], hull)
{
	engfunc(EngFunc_TraceHull, origin, origin, 0, hull, 0, 0);
	if (!get_tr2(0, TR_StartSolid) && !get_tr2(0, TR_AllSolid) && get_tr2(0, TR_InOpen))
		return true;
	
	return false;
}

// Check if a player is stuck (credits to VEN)
stock is_player_stuck(id)
{
	static Float:originF[3]
	pev(id, pev_origin, originF)
	engfunc(EngFunc_TraceHull, originF, originF, 0, (pev(id, pev_flags) & FL_DUCKING) ? HULL_HEAD : HULL_HUMAN, id, 0)
	if (get_tr2(0, TR_StartSolid) || get_tr2(0, TR_AllSolid) || !get_tr2(0, TR_InOpen))
		return true;
	
	return false;
}

// Get User Current Weapon Entity
stock fm_cs_get_current_weapon_ent(id)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return -1;
	
	return get_pdata_cbase(id, OFFSET_ACTIVE_ITEM, OFFSET_LINUX);
}

// Get Weapon Entity's Owner
stock fm_cs_get_weapon_ent_owner(ent)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(ent) != PDATA_SAFE)
		return -1;
	
	return get_pdata_cbase(ent, OFFSET_WEAPONOWNER, OFFSET_LINUX_WEAPONS);
}

// Set User Deaths
stock fm_cs_set_user_deaths(id, value)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSDEATHS, value, OFFSET_LINUX)
}

// Get User Team
stock fm_cs_get_user_team(id)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return 0; // FM_CS_TEAM_UNASSIGNED
	
	return get_pdata_int(id, OFFSET_CSTEAMS, OFFSET_LINUX);
}

// Set a Player's Team
stock fm_cs_set_user_team(id, team)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSTEAMS, team, OFFSET_LINUX);
}

// Set User Money
stock fm_cs_set_user_money(id, value)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_CSMONEY, value, OFFSET_LINUX);
}

// Set User Flashlight Batteries
stock fm_cs_set_user_batteries(id, value)
{
	// Prevent server crash if entity's private data not initalized
	if (pev_valid(id) != PDATA_SAFE)
		return;
	
	set_pdata_int(id, OFFSET_FLASHLIGHT_BATTERY, value, OFFSET_LINUX);
}

stock UTIL_TextMsg(id, szMessage[])
{
	message_begin(MSG_ONE, 77, _, id);
	write_byte(4);
	write_string(szMessage);
	message_end();
}

stock UTIL_BlinkAcct(id, BlinkAmt)
{
	message_begin(MSG_ONE_UNRELIABLE, 104, _, id);
	write_byte(BlinkAmt);
	message_end();
}

stock UTIL_PrecacheSounds(Array:sounds)
{
	new szBuffer[64];
	for (new i = 0; i < ArraySize(sounds); i++)
	{
		ArrayGetString(sounds, i, szBuffer, charsmax(szBuffer));
		precache_sound(szBuffer);
	}
}

stock UTIL_PrecacheMusic(Array:sounds, Array:isMP3)
{
	new szBuffer[64];
	for (new i = 0; i < ArraySize(sounds); i++)
	{
		ArrayGetString(sounds, i, szBuffer, charsmax(szBuffer));
		if (ArrayGetCell(isMP3, i))
		{
			format(szBuffer, charsmax(szBuffer), "sound/%s", szBuffer);
			precache_generic(szBuffer);
		}
		else precache_sound(szBuffer);
	}
}
