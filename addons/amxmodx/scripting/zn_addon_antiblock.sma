#include <amxmodx>
#include <fakemeta>
#include <zombienightmare>

new Float:g_LastTimeTouched[33];

public plugin_init()
{
	register_plugin("Anti Block", "1.0", "baarsik");
	register_forward(FM_Touch, "OnTouch");
	register_forward(FM_PlayerPreThink, "OnPlayerPreThink");
}

public OnPlayerPreThink(id)
{
	if(!is_user_alive(id))
		return FMRES_IGNORED;
	
	new Float:timeSpan = get_gametime() - g_LastTimeTouched[id];
	if(pev(id, pev_solid) == SOLID_NOT && timeSpan > 0.34)
	{
		set_pev(id, pev_solid, SOLID_SLIDEBOX);
	}
	
	return FMRES_IGNORED
}

public OnTouch(blocker, id)
{
	if(!is_user_alive(blocker) || !is_user_alive(id))
		return FMRES_IGNORED;
	
	if(pev(id, pev_button) & IN_USE || pev(blocker, pev_button) & IN_USE)
	{
		if(zp_get_user_zombie(id) != zp_get_user_zombie(blocker))
			return FMRES_IGNORED;
		
		set_pev(blocker, pev_solid, SOLID_NOT);
		set_pev(id, pev_solid, SOLID_NOT);
		
		new Float:gametime = get_gametime();
		g_LastTimeTouched[id] = gametime;
		g_LastTimeTouched[blocker] = gametime;
	}
	return FMRES_IGNORED;
}
	