#include <sdktools_gamerules>

int g_iTimeMap[2] = {30, 5}; //0 - это время для ze карта / 1 - это для зм карт
char g_sMap[32];

public void OnPluginStart()
{
	HookEvent("round_start", Event_RoundStart, EventHookMode_PostNoCopy);
}

public void OnMapStart()
{
	GetCurrentMap(g_sMap, sizeof(g_sMap));
}

public void Event_RoundStart(Event hEvent, const char[] sEvName, bool bDontBroadcast)
{
	CreateTimer(2.0, Timer_SeTime, _, TIMER_FLAG_NO_MAPCHANGE);
}

Action Timer_SeTime(Handle timer)
{
	if(StrContains(g_sMap, "ze_") != -1) GameRules_SetProp("m_iRoundTime", g_iTimeMap[0]);
	if(StrContains(g_sMap, "zm_") != -1) GameRules_SetProp("m_iRoundTime", g_iTimeMap[1]);
	return Plugin_Continue;
}