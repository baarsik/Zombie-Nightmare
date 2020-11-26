#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>
#include <zombienightmare>

new g_hegrenade_multiplier_zombie, g_hegrenade_multiplier_human

public plugin_init()
{
	register_plugin("[ZN] Custom HE Grenade", "1.2", "baarsik")
	g_hegrenade_multiplier_zombie = register_cvar("zp_hegrenade_dmg_zombie", "10.0")
	g_hegrenade_multiplier_human = register_cvar("zp_hegrenade_dmg_human", "0.75")
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage")
	RegisterHam(Ham_Killed, "player", "fw_PlayerKilled_Post", 1)
}

public fw_TakeDamage (victim, weapon, attacker, Float:damage, damagebits)
{
	if (!is_user_alive(attacker) || !is_user_alive(victim) || victim == attacker || damagebits != (1 << 24))
		return HAM_IGNORED

	if (zp_get_user_zombie(victim))
		SetHamParamFloat(4, damage * get_pcvar_float(g_hegrenade_multiplier_zombie));
	else
		SetHamParamFloat(4, damage * get_pcvar_float(g_hegrenade_multiplier_human));
		
	return HAM_IGNORED;
}

public fw_PlayerKilled_Post(victim, attacker, shouldgib)
{
	if(!zp_get_user_zombie(victim) || !is_user_alive(attacker))
		return HAM_IGNORED
	
	fm_give_item(attacker, "weapon_hegrenade");
	
	message_begin(MSG_ONE, get_user_msgid("WeapPickup"), {0,0,0}, attacker);
	write_byte(4);
	message_end();
	
	return HAM_IGNORED;
}

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