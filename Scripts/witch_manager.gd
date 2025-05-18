extends Node2D

var spawns : Array[Node];
@export var witches : Array[PackedScene];

func _ready():
	if witches.size() == 0:
		push_error("[witches] Array in WitchManager is empty!");
		return;
	
	spawns = [$WitchSpawn1, $WitchSpawn2, $WitchSpawn3, $WitchSpawn4, $WitchSpawn5, $WitchSpawn6, $WitchSpawn7, $WitchSpawn8, $WitchSpawn9];
	
	for witch in witches:
		# Randomly choose which spawn to spawn at
		var nextSpawn : int = randi() % spawns.size();
		
		# Spawn witch there
		var newWitch = witch.instantiate();
		newWitch.position = spawns[nextSpawn].position;
		$Witches.add_child(newWitch);
		
		# Remove the used spawn point
		spawns.remove_at(nextSpawn);
	
	spawns.clear();
	
	for witch in $Witches.get_children() as Array[PackedScene]:
		witch.begin_movement();
