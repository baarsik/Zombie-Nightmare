#include <amxmodx>
#include <cstrike>
#include <msgstocks>
#include <reapi>

enum UserInfo_t
{
	IsConnected,
	IsAlive,
	IsBot,
	HasNightvision,
	IsNightvisionEnabled,
	__USER_INFO_LENGTH
}

enum NvgColor_t
{
	Red,
	Green,
	Blue
}

new g_userInfo[33][UserInfo_t:__USER_INFO_LENGTH];
new cvar_nvgColor[NvgColor_t:3], cvar_nvgLightLevel;
new fwNightvisionTurnedOn_Pre, fwNightvisionTurnedOn_Post, fwNightvisionTurnedOff_Pre, fwNightvisionTurnedOff_Post;

public plugin_init()
{
	register_plugin("Custom Nightvision", "1.0-dev", "baarsik")

	// Hook client command
	register_clcmd("nightvision", "cmd_nightvision");

	// Hook ingame events
	RegisterHookChain(RG_CBasePlayer_Spawn, "CBasePlayer_Spawn_Post", 1);
	RegisterHookChain(RG_CBasePlayer_Killed, "CBasePlayer_Killed_Post", 1);

	// Cvars
	cvar_nvgColor[NvgColor_t:Red] = register_cvar("sv_nvg_color_red", "0");
	cvar_nvgColor[NvgColor_t:Green] = register_cvar("sv_nvg_color_green", "50");
	cvar_nvgColor[NvgColor_t:Blue] = register_cvar("sv_nvg_color_blue", "0");
	cvar_nvgLightLevel = register_cvar("sv_nvg_light_level", "x");

	// Forwards
	fwNightvisionTurnedOn_Pre = CreateMultiForward("NightvisionTurnedOn_Pre", ET_CONTINUE, FP_CELL, FP_VAL_BYREF, FP_VAL_BYREF, FP_VAL_BYREF, FP_VAL_BYREF, FP_CELL);
	fwNightvisionTurnedOn_Post = CreateMultiForward("NightvisionTurnedOn_Post", ET_IGNORE, FP_CELL);
	fwNightvisionTurnedOff_Pre = CreateMultiForward("NightvisionTurnedOff_Pre", ET_CONTINUE, FP_CELL, FP_VAL_BYREF, FP_CELL);
	fwNightvisionTurnedOff_Post = CreateMultiForward("NightvisionTurnedOff_Post", ET_IGNORE, FP_CELL);
}

public plugin_natives()
{
	register_native("SetUserNightvision", "native_set_user_nightvision", 1);
	register_native("RefreshUserNightvision", "native_refresh_nightvision_screenfade", 1);
	register_native("IsNightvisionEnabled", "native_is_nightvision_enabled", 1);
}

public bool:native_set_user_nightvision(id, bool:isEnabled, bool:isTurnedOn, bool:shouldEmitSound)
{
	if (!g_userInfo[id][UserInfo_t:IsConnected])
	{
		log_error(AMX_ERR_NATIVE, "[Nightvision] Invalid Player (ID: %d)", id);
		return false;
	}
	
	g_userInfo[id][UserInfo_t:HasNightvision] = isEnabled;

	if (g_userInfo[id][UserInfo_t:IsBot])
	{
		cs_set_user_nvg(id, isEnabled);
		return true;
	}

	SetNightvisionTurnedOn(id, isEnabled && isTurnedOn, shouldEmitSound);
	return true;
}

public native_refresh_nightvision_screenfade(id)
{
	if (!g_userInfo[id][UserInfo_t:HasNightvision])
		return;

	if (!g_userInfo[id][UserInfo_t:IsNightvisionEnabled])
		return;

	// Silently enable NVG again
	SetNightvisionTurnedOn(id, true, false);
}

public bool:native_is_nightvision_enabled(id)
{
	return bool:g_userInfo[id][UserInfo_t:IsNightvisionEnabled];
}

public client_putinserver(id)
{
	g_userInfo[id][UserInfo_t:IsConnected] = true;
	g_userInfo[id][UserInfo_t:IsAlive] = is_user_alive(id);
	g_userInfo[id][UserInfo_t:IsBot] = is_user_bot(id);
	g_userInfo[id][UserInfo_t:HasNightvision] = false;
	g_userInfo[id][UserInfo_t:IsNightvisionEnabled] = false;
}

public client_disconnected(id)
{
	g_userInfo[id][UserInfo_t:IsConnected] = false;
	g_userInfo[id][UserInfo_t:IsAlive] = false;
	g_userInfo[id][UserInfo_t:IsBot] = false;
	g_userInfo[id][UserInfo_t:HasNightvision] = false;
	g_userInfo[id][UserInfo_t:IsNightvisionEnabled] = false;
}

public CBasePlayer_Spawn_Post(const this)
{
	g_userInfo[this][UserInfo_t:IsNightvisionEnabled] = false;
	g_userInfo[this][UserInfo_t:IsAlive] = true;
}

public CBasePlayer_Killed_Post(const this, pevAttacker, iGib)
{
	if (g_userInfo[this][UserInfo_t:IsNightvisionEnabled])
	{
		fade_user_screen(this, _, _, ScreenFadeFlags:ScreenFade_FadeOut, 100, 100, 100, 255);
	}
	g_userInfo[this][UserInfo_t:IsAlive] = false;
	g_userInfo[this][UserInfo_t:HasNightvision] = false;
	g_userInfo[this][UserInfo_t:IsNightvisionEnabled] = false;
}

public cmd_nightvision(id)
{
	if(!g_userInfo[id][UserInfo_t:IsConnected])
		return PLUGIN_HANDLED;

	if(!g_userInfo[id][UserInfo_t:HasNightvision])
		return PLUGIN_HANDLED;

	SetNightvisionTurnedOn(id, !g_userInfo[id][UserInfo_t:IsNightvisionEnabled], true);
	return PLUGIN_HANDLED;
}

public SetNightvisionTurnedOn(id, bool:isTurnedOn, bool:shouldEmitSound)
{
	if(!g_userInfo[id][UserInfo_t:IsConnected])
		return;

	if(!g_userInfo[id][UserInfo_t:HasNightvision])
		return;
	
	new lightLevel[2];
	new lightLevelLen = sizeof(lightLevel);
	new forwardReturn;

	if (isTurnedOn)
	{
		new nvgColor[NvgColor_t:3];
		nvgColor[NvgColor_t:Red] = get_pcvar_num(cvar_nvgColor[NvgColor_t:Red]);
		nvgColor[NvgColor_t:Green] = get_pcvar_num(cvar_nvgColor[NvgColor_t:Green]);
		nvgColor[NvgColor_t:Blue] = get_pcvar_num(cvar_nvgColor[NvgColor_t:Blue]);
		get_pcvar_string(cvar_nvgLightLevel, lightLevel, charsmax(lightLevel));

		ExecuteForward(fwNightvisionTurnedOn_Pre, forwardReturn, id, nvgColor[NvgColor_t:Red], nvgColor[NvgColor_t:Green], nvgColor[NvgColor_t:Blue], lightLevel, lightLevelLen)
		if (forwardReturn == PLUGIN_HANDLED)
			return;

		g_userInfo[id][UserInfo_t:IsNightvisionEnabled] = true;
		fade_user_screen(
			id,
			_,
			_,
			ScreenFadeFlags:ScreenFade_StayOut,
			nvgColor[NvgColor_t:Red],
			nvgColor[NvgColor_t:Green],
			nvgColor[NvgColor_t:Blue],
			100);
		SetLight(id, lightLevel);

		ExecuteForward(fwNightvisionTurnedOn_Post, _, id);
	}
	else
	{
		lightLevel = "k"; // Default light level value

		ExecuteForward(fwNightvisionTurnedOff_Pre, forwardReturn, id, lightLevel, lightLevelLen)
		if (forwardReturn == PLUGIN_HANDLED)
			return;

		g_userInfo[id][UserInfo_t:IsNightvisionEnabled] = false;
		fade_user_screen(id, 0.0, 0.0, ScreenFadeFlags:ScreenFade_FadeIn, 0, 0, 0, 255);
		SetLight(id, lightLevel);

		ExecuteForward(fwNightvisionTurnedOff_Post, _, id);
	}

	if (shouldEmitSound)
	{
		client_cmd(id, g_userInfo[id][UserInfo_t:IsNightvisionEnabled]
			? "spk items/nvg_off.wav"
			: "spk items/nvg_off.wav");
	}
}

SetLight(id, light[2])
{
	if(!g_userInfo[id][UserInfo_t:IsConnected])
		return

	message_begin(MSG_ONE, SVC_LIGHTSTYLE, _, id)
	write_byte(0)
	write_string(light)
	message_end()
}