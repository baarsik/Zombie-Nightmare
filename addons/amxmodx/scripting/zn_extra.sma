/*
*	==========================
*	======== SETTINGS ========
*	==========================
*/

#define INFECT_RADIUS		70.0			// 65 units infection range
#define MEDKIT_HEAL			30				// Heal 30 HP

/*
*	==========================
*	====== SETTINGS END ======
*	==========================
*/

#include <amxmodx>
#include <fakemeta_util>
#include <hamsandwich>
#include <zombienightmare>

#define is_user_valid_alive(%1) (1 <= %1 <= g_maxplayers && is_user_alive(%1))

new g_itemid_bullet, g_itemid_infect, g_itemid_medkit, g_itemid_instantinfect
new g_bullets[33], bool:g_hamczbots, bool:g_infect[33], g_maxplayers
new g_msgSayText
new cvar_botquota

public plugin_init()
{
	register_plugin("[ZN] Extra items", "1.4", "baarsik")
	RegisterHam(Ham_TakeDamage, "player", "fw_TakeDamage")
	cvar_botquota = get_cvar_pointer("bot_quota")
	g_itemid_bullet = zp_register_extra_item("Deadly bullet", 25, ZP_TEAM_HUMAN)
	g_itemid_infect = zp_register_extra_item("Chainy infection", 15, ZP_TEAM_ZOMBIE)
	g_itemid_medkit = zp_register_extra_item("Medkit", 20, ZP_TEAM_HUMAN)
	g_itemid_instantinfect = zp_register_extra_item("Instant infect", 20, ZP_TEAM_ZOMBIE)
	g_msgSayText = get_user_msgid("SayText")
	g_maxplayers = get_maxplayers()
}

public client_putinserver(id)
{
	if(is_user_bot(id) && !g_hamczbots && cvar_botquota)
		set_task(0.1, "register_ham_czbots", id)
}

public register_ham_czbots(Player)
{
	if (g_hamczbots || !is_user_connected(Player) || !get_pcvar_num(cvar_botquota))
		return
	
	RegisterHamFromEntity(Ham_TakeDamage, Player, "fw_TakeDamage")
	g_hamczbots = true
}

public zp_extra_item_selected(id, itemid)
{
	new prefix[32]
	zp_get_server_prefix(prefix, charsmax(prefix))
	if(itemid == g_itemid_bullet)
	{
		g_bullets[id]++
		zp_colored_print(id, "^x04[%s]^x01 Вы купили^x04 Смертельную пулю^x01. Количество пуль:^x04 %d^x01.", prefix, g_bullets[id])
	}
	else if(itemid == g_itemid_infect)
	{
		g_infect[id] = true
		zp_colored_print(id, "^x04[%s]^x01 Вы купили^x04 Цепное заражение^x01.", prefix)
		zp_colored_print(id, "^x04[%s]^x01 Вокруг зараженных вами игроков будет создана волна инфекции.", prefix)
	}
	else if(itemid == g_itemid_medkit)
	{
		static health, maxhealth
		if(zp_get_user_vip(id)) maxhealth = 125
		else maxhealth = 100
		health = get_user_health(id)
		if(health==maxhealth)
		{
			zp_colored_print(id, "^x04[%s]^x01 У вас уже полный запас здоровья.", prefix)
			return ZP_PLUGIN_HANDLED
		}
		if(health+MEDKIT_HEAL < maxhealth) fm_set_user_health(id, health+MEDKIT_HEAL)
		else fm_set_user_health(id, maxhealth)
		zp_colored_print(id, "^x04[%s]^x01 Вы купили^x04 Аптечку^x01. Восстановлено^x04 %d^x01 здоровья.",
			prefix, get_user_health(id) - health)
	}
	else if(itemid == g_itemid_instantinfect)
	{
		zp_set_user_instainf(id, true)
		zp_colored_print(id, "^x04[%s]^x01 Вы купили^x04 Моментальное заражение^x01. Теперь вы заражаете с одного удара.", prefix)
	}
	return 0
}

public zn_user_humanized_post(id)
{
	zero_values(id)
}

public client_connect(id)
{
	zero_values(id)
}

public client_disconnected(id, bool:drop, message[], maxlen)
{
	zero_values(id)
}

public zn_user_infected_post(id, infector)
{
	if(zp_get_user_zombie(id))
	{
		zero_values(id);
		if(g_infect[infector])
		{
			new victim = -1;
			new Float:originF[3];
			pev(id, pev_origin, originF);
			while ((victim = engfunc(EngFunc_FindEntityInSphere, victim, originF, INFECT_RADIUS)) != 0)
			{
				if (!is_user_valid_alive(victim) || zp_get_user_zombie(victim))
					continue;
				
				zp_infect_user(victim, infector, 0, 1);
			}
		}
	}
}

public fw_TakeDamage(victim, inflictor, attacker, Float:damage)
{
	if(victim == attacker || !is_user_connected(attacker))
		return HAM_IGNORED
	
	if(!zp_get_user_zombie(victim) || zp_get_user_zombie(attacker))
		return HAM_IGNORED
	
	if(g_bullets[attacker] > 0) {
		g_bullets[attacker]--
		SetHamParamFloat(4, float(get_user_health(victim)))
		return HAM_IGNORED
	}
	return HAM_IGNORED
}

zero_values(id)
{
	g_bullets[id] = 0
	g_infect[id] = false
}

zp_colored_print(target, const message[], any:...)
{
	static buffer[512], i, argscount
	argscount = numargs()
	if (!target)
	{
		static player
		for (player = 1; player <= g_maxplayers; player++)
		{
			if (!is_user_connected(player))
				continue;
			
			static changed[5], changedcount // [5] = max LANG_PLAYER occurencies
			changedcount = 0
			for (i = 2; i < argscount; i++)
			{
				if (getarg(i) == LANG_PLAYER)
				{
					setarg(i, 0, player)
					changed[changedcount] = i
					changedcount++
				}
			}
			vformat(buffer, charsmax(buffer), message, 3)
			message_begin(MSG_ONE_UNRELIABLE, g_msgSayText, _, player)
			write_byte(player)
			write_string(buffer)
			message_end()
			for (i = 0; i < changedcount; i++)
			{
				setarg(changed[i], 0, LANG_PLAYER)
			}
		}
	}
	else
	{
		vformat(buffer, charsmax(buffer), message, 3)
		message_begin(MSG_ONE, g_msgSayText, _, target)
		write_byte(target)
		write_string(buffer)
		message_end()
	}
}