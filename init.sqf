//--- Params //////////////////////////////////////////////////////////
//Generates a variable for each parameter based on the parameters class name:
for "_i" from 0 to (count paramsArray - 1) do
{
	missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), paramsArray select _i];
};

// Set friendly/enemy sides
EAST setFriend [WEST, 0];
WEST setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
WEST setFriend [RESISTANCE, 0];

//call POPO_fnc_initCommon;
call POPO_fnc_initCommonConstants;
call POPO_fnc_initParametersCommon;
call POPO_fnc_initParametersServer;

["marker_0","['marker_0',independent_Units ,4] call POPO_fnc_reinforcementInfantry","WEST","GUER D"] call POPO_fnc_CreateTriggerGetMarker;
["marker_0","['marker_0',independent_Reinforcement ,2] call POPO_fnc_reinforcementVehicle","WEST","GUER D"] call POPO_fnc_CreateTriggerGetMarker;


// Intro
/*
if (time < 10) then
{
titleCut ["", "BLACK FADED", 999];
sleep 5;
[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	// Info text
	[("Insertion ...")] spawn BIS_fnc_infoText;

	playMusic "LeadTrack02_F_EPC";

	sleep 15;

	[str("île de Tanoa") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By 1er-RPIMA")] spawn BIS_fnc_infoText;

	sleep 10;

	titleCut ["", "BLACK IN", 4]

	};
};
*/