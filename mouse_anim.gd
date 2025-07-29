extends AnimatedSprite2D

func _ready():
	Global.mouseani = self
	var ani = self
	var SpriteFrame = ani.sprite_frames
	var item
	SpriteFrame.add_animation("item")
	SpriteFrame.add_frame("item", item)
	ani.play("item")
	
