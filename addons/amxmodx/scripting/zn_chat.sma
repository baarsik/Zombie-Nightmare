#include <amxmodx>
#include <cstrike>
#include <zombienightmare>

new g_msgSayText, g_msgTeamInfo, g_maxplayers
new bool:g_message[33]
enum Color { NORMAL = 1, GREEN, TEAM_COLOR, GREY, RED, BLUE }

public plugin_init() {
	register_plugin ("[ZN] Chat", "2.0", "baarsik")
	g_msgSayText = get_user_msgid ("SayText")
	g_msgTeamInfo = get_user_msgid("TeamInfo")
	register_message(g_msgSayText, "msg_saytext")
	register_clcmd("say", "clcmd_say")
	register_clcmd("say_team", "clcmd_say_team")
	g_maxplayers = get_maxplayers()
}

public client_putinserver(id)
{
	g_message[id] = false;
}

public msg_saytext(msgId, msgDest, receiver)
	return PLUGIN_HANDLED;

public clcmd_say(id) {
	if(!is_user_connected(id))
		return PLUGIN_CONTINUE
	
	new message[171], sendmessage[185]
	read_args(message, 150)
	remove_quotes(message)
	replace_all(message, charsmax(message), "%", " ")
	trim(message)
	while(replace(message, charsmax(message), "  ", " ")) {}
	replace_all(message, charsmax(message), "#", "")
	if(message[0] == '/' || message[0] == '!' || equal (message, "") || equal(message, "timeleft") || equal(message, "nextmap") || equal(message, "rtv"))
		return PLUGIN_CONTINUE
	
	new name[32], postfix[10], prefix[14], CsTeams:team
	static sid
	get_user_name(id, name, 31)
	team = cs_get_user_team(id)
	if(zp_get_user_vip(id)) formatex(postfix, charsmax(postfix), " ^1(^4VIP^1)")
	if(team == CS_TEAM_UNASSIGNED || team == CS_TEAM_SPECTATOR) formatex(prefix, charsmax(prefix), "^1*^4SPEC^1*^3 ")
	else if(!is_user_alive(id)) formatex(prefix, charsmax(prefix), "^1*^4DEAD^1*^3 ")
	formatex(sendmessage, charsmax(sendmessage), "%s%s%s^1 : %s", prefix, name, postfix, message)
	if(g_message[id]) sid = id;
	else sid = 0;
	if(zp_get_user_zombie(id)) ColorChat(sid, RED, sendmessage)
	else ColorChat(sid, BLUE, sendmessage)
	g_message[id] = true
	remove_task(40205+id)
	set_task(0.6, "task_allow", 40205+id)
	return PLUGIN_HANDLED
}

public task_allow(id) {
	id -= 40205;
	g_message[id] = false;
}

public clcmd_say_team(id) {
	if(!is_user_connected(id))
		return PLUGIN_CONTINUE
	
	new message[171], sendmessage[185], CsTeams:team
	team = cs_get_user_team(id)
	if(team == CS_TEAM_UNASSIGNED || team == CS_TEAM_SPECTATOR)
		return PLUGIN_HANDLED
	
	read_args(message, 150)
	remove_quotes(message)
	replace_all(message, charsmax(message), "%", " ")
	trim(message)
	while(replace(message, charsmax(message), "  ", " ")) {}
	replace_all(message, charsmax(message), "#", "")
	
	if (message[0] == '/' || message[0] == '!' || equal (message, ""))
		return PLUGIN_CONTINUE
	
	new name[32], prefix[34], postfix[10], zombie
	zombie = zp_get_user_zombie(id)
	get_user_name(id, name, 31)
	if(zp_get_user_vip(id)) formatex(postfix, charsmax(postfix), " ^1(^4VIP^1)")
	if(is_user_alive(id)) {
		if(zombie) formatex(prefix, charsmax(prefix), "^1(^4Zombie^1)^3 ")
		else formatex(prefix, charsmax(prefix), "^1(^4Human^1)^3 ")
	} else {
		if(zombie) formatex(prefix, charsmax(prefix), "^1*^4DEAD^1* (^4Zombie^1)^3 ")
		else formatex(prefix, charsmax(prefix), "^1*^4DEAD^1* (^4Human^1)^3 ")
	}
	formatex(sendmessage, charsmax(sendmessage), "%s%s%s^1 : %s", prefix, name, postfix, message)
	if(zombie) {
		for(new i=1; i <= g_maxplayers; i++) if(zp_get_user_zombie(i))
			ColorChat(i, RED, sendmessage)
	} else {
		for(new i=1; i <= g_maxplayers; i++) if(!zp_get_user_zombie(i))
			ColorChat(i, BLUE, sendmessage)
	}
	return PLUGIN_HANDLED
}

ColorChat(id, Color:type, const msg[], any:...) {
	new message[256]
	switch(type) {
		case NORMAL: message[0] = 0x01
		case GREEN: message[0] = 0x04
		default: message[0] = 0x03
	}
	vformat(message[1], 251, msg, 4)
	message[192] = '^0'
	new CsTeams:team, ColorChange, index, MSG_Type
	if(id) {
		if(!is_user_connected(id))
			return
		
		MSG_Type = MSG_ONE_UNRELIABLE
		index = id
	} else {
		index = FindPlayer()
		MSG_Type = MSG_BROADCAST
	}
	team = cs_get_user_team(index)
	ColorChange = ColorSelection(index, MSG_Type, type)
	ShowColorMessage(index, MSG_Type, message)
	if(ColorChange) {
		if(team == CS_TEAM_UNASSIGNED) Team_Info(index, MSG_Type, "")
		else if(team == CS_TEAM_T) Team_Info(index, MSG_Type, "TERRORIST")
		else if(team == CS_TEAM_CT) Team_Info(index, MSG_Type, "CT")
		else Team_Info(index, MSG_Type, "SPECTATOR")
	}
}

ShowColorMessage(id, type, message[]) {
	message_begin(type, g_msgSayText, _, id)
	write_byte(id)
	write_string(message)
	message_end()
}

Team_Info(id, type, team[]) {
	message_begin(type, g_msgTeamInfo, _, id)
	write_byte(id)
	write_string(team)
	message_end()
	return 1
}

ColorSelection(index, type, Color:Type) {
	switch(Type) {
		case RED: return Team_Info(index, type, "TERRORIST")
		case BLUE: return Team_Info(index, type, "CT")
		case GREY: return Team_Info(index, type, "")
	}
	return 0
}

FindPlayer() {
	new i = -1
	while(i <= g_maxplayers) {
		if(is_user_connected(++i))
			return i
	}
	return -1
}