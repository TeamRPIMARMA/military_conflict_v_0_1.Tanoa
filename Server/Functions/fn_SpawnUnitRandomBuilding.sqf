/*
  # HEADER #
	Script: 		Server\Functions\fn_SpawnUnitRandomBuilding.sqf
	Alias:			
	Description:			      
          <FR = La fonction permet de créer des unités aléatoire avec un spawn aléatoire à l'intérieur des bâtiments les plus proches du marqueur.
          
          
          EN = The function allows you to create random units with a random spawn inside the buildings closest to the marker.
          
	Author: 		Popo
	Creation Date:	25-05-2024
	Revision Date:	31-05-2024
	
  # PARAMETERS #
  0	[array]: The type of units to create
  1	[number]: number of units created
  2	[position]: name marker
  3	[number]: distance radius
  

  # RETURNED VALUE #

  # SYNTAX #
	["_TypeUnits","_numberUnits","_nameMarker","_distanceRadius"] spawn POPO_Common_fnc_SpawnRandomHostagesBuilding;

  # DEPENDENCIES # 
  call POPO_fnc_SkillSet

  # EXAMPLE # 
  [unit, number unit, getPosition marker, distance radius marker] spawn POPO_Server_fnc_SpawnUnitRandomBuilding;
  [Units_Resistance, 5, "units_marker_0", 500] call POPO_Server_fnc_SpawnUnitRandomBuilding;
*/
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Fonction spawn aléatoirement des Hostages captifs random à l'intérieur de bâtiment avec les options 
params ["_TypeUnits","_numberUnits","_nameMarker","_distanceRadius"];

private "_UnitsCreated";
for "_i" from 1 to _numberUnits do // a loop repeating X times
{
  _buildings = nearestObjects [(getMarkerPos _nameMarker), ["house"], _distanceRadius];
  _building = selectRandom _buildings;
  _buildingPositions = [_building] call BIS_fnc_buildingPositions;
  _UnitsCreated = independent_grp_units createUnit [(selectRandom _TypeUnits), (selectRandom _buildingPositions), [], 0, "NONE"];
  [_UnitsCreated] joinSilent independent_grp_units;
  _UnitsCreated setFormDir random 360;
   doStop _UnitsCreated;
  _UnitsCreated setunitpos "UP";
  //_child setDir (_parentDir + (_childDir - _parentDir))
  //_UnitsCreated setDir random 360;
  //{_UnitsCreated DisableAI _x} forEach ["MOVE"];
  [_UnitsCreated,SYNDIKAT_INFskill,0,0.5] call POPO_fnc_SkillSet;
  if (CTI_POPO_Debug_ENABLE isEqualTo 1) then {player globalChat format ["%1", _i];};
};

true

