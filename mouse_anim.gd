extends AnimatedSprite2D

@onready var mouse_amount: Label = $Label
@export var item: InvItem
@export var amount: InvSlot

func _ready():
	Global.mouseani = self
	var ani = self
	var SpriteFrame = ani.sprite_frames
	SpriteFrame.add_animation("item")
	SpriteFrame.add_frame("item", item)
	ani.play("item")
	Global.mouseani.mouse_amount.visible = false
