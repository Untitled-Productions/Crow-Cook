extends AnimatedSprite2D

@export var item: InvItem

func _ready():
	Global.mouseani = self
	var ani = self
	var SpriteFrame = ani.sprite_frames
	SpriteFrame.add_animation("item")
	SpriteFrame.add_frame("item", item)
	ani.play("item")
	
