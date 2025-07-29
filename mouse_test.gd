extends CharacterBody2D

@onready var mouse = self


func _physics_process(delta: float) -> void:
	mouse.global_position = get_global_mouse_position()
	move_and_slide()
