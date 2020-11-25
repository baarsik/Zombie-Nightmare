#include <amxmodx>
#include <zombienightmare>

new g_infect[][] =
{
	"zn/infect_01.wav", "zn/infect_02.wav", "zn/infect_03.wav", "zn/infect_04.wav", "zn/infect_05.wav", "zn/infect_06.wav"
}

public plugin_init()
{
	register_plugin("[ZN] Infect Human Sound", "1.1", "baarsik");
}

public plugin_precache()
{
	for(new i = 0; i < sizeof g_infect; i++)
	{
		precache_sound(g_infect[i]);
	}
}

public zn_user_infected_post(id, infector)
{
	for(new i=1; i<=33; i++)
	{
		if(!is_user_connected(i) || id == i)
			continue;
		
		if(!zp_get_user_zombie(i))
		{
			client_cmd(i,"speak ^"%s^"", g_infect[random_num(0, charsmax(g_infect))]);
		}
	}
}