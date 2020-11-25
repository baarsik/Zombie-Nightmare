#define VERSION "1.0"

#define ZOMBIE_COLOR_RED 255
#define ZOMBIE_COLOR_GREEN 100
#define ZOMBIE_COLOR_BLUE 50

#define HUMAN_COLOR_RED 0
#define HUMAN_COLOR_GREEN 125
#define HUMAN_COLOR_BLUE 255

#include <amxmodx>
#include <zombienightmare>

new g_status_sync;

public plugin_init()
{
	register_plugin("[ZN] Aim Info", VERSION, "@bdul! / Sn!ff3r / baarsik");
	register_event("StatusValue", "ShowStatus", "be", "1=2", "2!0");
	register_event("StatusValue", "HideStatus", "be", "1=1", "2=0");
	register_dictionary("zombie_nightmare.txt");
	g_status_sync = CreateHudSyncObj();
}

public ShowStatus(id)
{
	if(!is_user_bot(id) && is_user_connected(id))
	{
		new name[32], class[32], pid = read_data(2)
		get_user_name(pid, name, 31)
		if(zp_get_user_zombie(pid))
		{
			set_hudmessage(ZOMBIE_COLOR_RED, ZOMBIE_COLOR_GREEN, ZOMBIE_COLOR_BLUE, -1.0, 0.60, 1, 0.01, 3.0, 0.01, 0.01, -1);
			zn_get_user_class(pid, class, 31);
		}
		else
		{
			set_hudmessage(HUMAN_COLOR_RED, HUMAN_COLOR_GREEN, HUMAN_COLOR_BLUE, -1.0, 0.60, 1, 0.01, 3.0, 0.01, 0.01, -1);
			zn_get_user_class(pid, class, 31);
		}
		ShowSyncHudMsg(id, g_status_sync, "%L", LANG_PLAYER, "AIM_INFO", name, class, zp_get_user_ammo_packs(pid), zp_get_user_souls(pid));
	}
}

public HideStatus(id)
{
	ClearSyncHud(id, g_status_sync);
}