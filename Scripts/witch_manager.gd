extends Node2D

var spawns : Array[Node];
@export var witches : Array[PackedScene];

func _ready():
	if witches.size() == 0:
		push_error("[witches] Array in WitchManager is empty!");
		return;
	
	spawns = [$WitchSpawn01, $WitchSpawn02, $WitchSpawn03, $WitchSpawn04, $WitchSpawn05, $WitchSpawn06, $WitchSpawn07, $WitchSpawn08, $WitchSpawn09];
	var witchesArray : Array[Witch];
	
	for witch in witches:
		# Randomly choose which spawn to spawn at
		var nextSpawn : int = randi() % spawns.size();
		
		# Spawn witch there
		var newWitch = witch.instantiate();
		newWitch.position = spawns[nextSpawn].position;
		$Witches.add_child(newWitch);
		witchesArray.append(newWitch);
		
		# Remove the used spawn point
		spawns.remove_at(nextSpawn);
	
	spawns.clear();
	
	GameManager.set_witches(witchesArray);
	
	for witch in $Witches.get_children() as Array[PackedScene]:
		witch.begin_movement();
