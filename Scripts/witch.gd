extends RigidBody2D

@export var display_name : String = "DEFAULT_WITCH";
var starting_force : int = 50;

func begin_movement() -> void:
	self.apply_impulse(Vector2(randi() % starting_force, randi() % starting_force));

func body_entered(body : Node) -> void:
	
	if (body.name == "Flag"):
		get_tree().paused = true;
	
	if (body is RigidBody2D):
		self.apply_impulse(self.position - body.linear_velocity);
