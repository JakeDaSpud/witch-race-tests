extends Node

var win_label : RichTextLabel;
var current_level_id : int = 1;
var witchesArray : Array[Witch];

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			start_level(current_level_id);
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			current_level_id = current_level_id + 1;
			if (current_level_id > 2):
				current_level_id = 1;
			start_level(current_level_id);

func start_level(current_level_id):
	if (current_level_id == 1):
		get_tree().change_scene_to_file("res://Scenes/level_01.tscn");
	elif (current_level_id == 2):
		get_tree().change_scene_to_file("res://Scenes/level_02.tscn");

func set_witches(witchesArray : Array[Witch]):
	self.witchesArray = witchesArray;

func terminate_losers(winnerName : String):
	for witch in witchesArray:
		witch.winner_alert(winnerName);
		witchesArray.erase(witch);

func set_win_text(str : String):
	pass;
