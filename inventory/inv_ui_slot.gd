extends Panel

var playerBody: CharacterBody2D

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

signal update

func visuals(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		amount_text.text = str(slot.amount)


func on_button_pressed(slot: InvSlot):
	item_visual.visible = false
	amount_text.visible = false
	slot.amount = 0
	print("false")
	



func _on_button_pressed() -> void:
	Global.pressed = true
	print("true")
