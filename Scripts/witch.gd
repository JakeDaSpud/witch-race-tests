extends RigidBody2D

class_name Witch

@export var display_name : String = "DEFAULT_WITCH";
var starting_force : int = 50;
var bounce_force : float = 1.5;

func _ready() -> void:
	self.connect("body_entered", Callable(self, "on_body_entered"));

func _physics_process(delta) -> void:
	var colliding : Array[Node2D] = get_colliding_bodies();
	
	for col in colliding:
		# Check for Flag
		if (col.name == "Flag"):
			$Sprite.scale = Vector2(5, 5);
			GameManager.terminate_losers(self.display_name);
			GameManager.set_win_text(self.display_name);
			return;
		
		if (col is StaticBody2D) || (col is RigidBody2D):
			apply_random_impulse();

func begin_movement() -> void:
	apply_random_impulse();

func winner_alert(winnerName : String) -> void:
	if self.display_name != winnerName:
		self.queue_free();

func apply_random_impulse() -> void:
	var direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized();
	self.apply_impulse(direction * starting_force);
