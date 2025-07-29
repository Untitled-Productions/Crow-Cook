extends AnimatedSprite2D

func _ready():
	Global.mouseani = self
	var ani = self
	var item = $Logo.texture
	var SpriteFrame = ani.sprite_frames
	SpriteFrame.add_animation("item")
	SpriteFrame.add_frame("item", item)
	ani.play("item")
	
