#define ACCESS_VIP ADMIN_LEVEL_H
#define TASK_ID 584000

#include <amxmodx>
#include <cstrike>
#include <zombienightmare>

new g_seconds[33], bool:g_ended;
new cvar_deathmatch;

public plugin_init()
{
	register_plugin("[ZN] Respawn Newbies", "1.2", "baarsik");
	register_logevent("RoundStart", 2, "1=Round_Start");
	register_dictionary("zombie_nightmare.txt");
	cvar_deathmatch = get_cvar_pointer("zp_deathmatch");
}

public client_putinserver(id)
{
	if(!get_pcvar_num(cvar_deathmatch) || get_pcvar_num(cvar_deathmatch) == 5)
		return;
	
	remove_task(TASK_ID + id);
	if(get_user_flags(id) & ACCESS_VIP) g_seconds[id] = 5;
	else g_seconds[id] = 20;
	set_task(1.0, "task_respawn", TASK_ID + id);
}

public client_disconnected(id, bool:drop, message[], maxlen)
{
	g_seconds[id] = 0;
	remove_task(TASK_ID + id);
}

public task_respawn(id)
{
	remove_task(id);
	id -= TASK_ID;
	if(!is_user_connected(id) || g_ended)
		return PLUGIN_HANDLED;
	
	if(is_user_alive(id))
		return PLUGIN_HANDLED;
	
	if(cs_get_user_team(id) != CS_TEAM_T && cs_get_user_team(id) != CS_TEAM_CT)
	{
		set_task(1.0, "task_respawn", TASK_ID + id);
		return PLUGIN_HANDLED;
	}
	
	if(g_seconds[id] > 0)
	{
		client_print(id, print_center, "%L", id, "RESPAWN_IN", g_seconds[id]);
		g_seconds[id]--;
		set_task(1.0, "task_respawn", TASK_ID + id);
		return PLUGIN_HANDLED;
	}
	
	zp_respawn_user(id, ZP_TEAM_ZOMBIE);
	return PLUGIN_HANDLED;
}

public zp_round_ended(winteam)
{
	g_ended = true;
}

public RoundStart()
{
	g_ended = false;
}