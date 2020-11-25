#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>
#include <zombienightmare>

new g_Cvar

public plugin_init() {
	register_plugin("[ZN] Custom HE Grenade", "1.1", "Felix_Font / baarsik")
	g_Cvar = register_cvar("zp_hegr_zombie", "10.0")
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage")
	RegisterHam(Ham_Killed, "player", "fw_PlayerKilled_Post", 1)
	set_task(1.0, "disable_fire")
}

public disable_fire() {
	if(get_cvar_num("zp_fire_grenades") == 1)
		set_cvar_num("zp_fire_grenades", 0)
}

public fw_TakeDamage (victim, weapon, attacker, Float:damage, damagebits) {
	if (!is_user_alive(attacker) || !is_user_alive(victim) || victim == attacker || damagebits != (1 << 24))
		return HAM_IGNORED

	if (zp_get_user_zombie(victim))
		SetHamParamFloat(4, damage * get_pcvar_float(g_Cvar))
	
	return HAM_IGNORED
}

public fw_PlayerKilled_Post(victim, attacker, shouldgib) {
	if(!zp_get_user_zombie(victim) || !is_user_alive(attacker))
		return HAM_IGNORED
	
	fm_give_item(attacker, "weapon_hegrenade")
	message_begin(MSG_ONE, get_user_msgid("WeapPickup"), {0,0,0}, attacker) 
	write_byte(4)
	message_end()
	return HAM_IGNORED
}

stock fm_give_item(id, const item[]) {
	static ent
	ent = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, item))
	if (!pev_valid(ent)) return;
	
	static Float:originF[3]
	pev(id, pev_origin, originF)
	set_pev(ent, pev_origin, originF)
	set_pev(ent, pev_spawnflags, pev(ent, pev_spawnflags) | SF_NORESPAWN)
	dllfunc(DLLFunc_Spawn, ent)
	
	static save
	save = pev(ent, pev_solid)
	dllfunc(DLLFunc_Touch, ent, id)
	if (pev(ent, pev_solid) != save)
		return;
	
	engfunc(EngFunc_RemoveEntity, ent)
}