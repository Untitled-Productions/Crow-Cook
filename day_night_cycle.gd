extends DirectionalLight2D

@onready var light = self
@onready var time = $Timer
@onready var night = false

func _on_timer_timeout() -> void:
	time.start(10)
	if light.energy >= 0.01 and night == true:
		light.energy -= 0.01
	else:
		night = false
	if light.energy <= 0.5 and night == false:
		light.energy += 0.01
	else:
		night = true
	
