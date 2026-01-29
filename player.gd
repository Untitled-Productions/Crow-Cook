extends CharacterBody2D



const SPEED = 300.0

@onready var areacollect

@export var inventory: Inventory

func _ready():
	Global.playerBody = self


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Global.invop == false:
		var directionx := Input.get_axis("ui_left", "ui_right")
		if directionx:
			velocity.x = directionx * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		var directiony := Input.get_axis("ui_up", "ui_down")
		if directiony:
			velocity.y = directiony * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()

func player():
	pass

func _process(delta):
	Global.playerBody = self
	SaveManager.SavePos = self.global_position
	collecting(areacollect)

func _on_area_2d_area_entered(area):
	if area.has_method("collect"):
		areacollect = area

func collecting(area):
	if area != null and Input.is_action_just_pressed("ui_grab"):
		area.collect(inventory)
