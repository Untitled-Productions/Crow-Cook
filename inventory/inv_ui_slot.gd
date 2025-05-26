extends Panel


@export var inv: Inv
@export var item: InvItem

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

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




func on_button_pressed():
	Global.pressed = true
	print("true")
	inv.export(item)
	item = null
	item_visual.texture = null
