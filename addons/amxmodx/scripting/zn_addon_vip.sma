#include <amxmodx>
#include <fakemeta_util>
#include <hamsandwich>
#include <zombienightmare>

new g_MaxPlayers;

public plugin_init() {
	register_plugin("[ZN] Addon: VIP system", "1.1", "baarsik");
	register_event("HLTV", "OnRoundStart", "a", "1=0", "2=0");
	RegisterHam(Ham_Spawn, "player", "OnPlayerSpawnPost", 1);
	g_MaxPlayers = get_maxplayers();
}

public OnRoundStart()
{
	for (new id = 1; id <= g_MaxPlayers; id++)
	{
		if(!is_user_connected(id) || !zp_get_user_vip(id))
			return;
		
		zp_set_user_ammo_packs(id, zp_get_user_ammo_packs(id) + 5);
	}
}

public OnPlayerSpawnPost(id)
{
	if(!is_user_connected(id) || !zp_get_user_vip(id))
		return;
	
	if(!zp_get_user_zombie(id))
	{
		fm_set_user_health(id, get_user_health(id) + 25);
	}
}

public zn_user_humanized_post(id)
{
	if(!zp_get_user_vip(id))
		return;
	
	fm_set_user_health(id, get_user_health(id) + 25);
}