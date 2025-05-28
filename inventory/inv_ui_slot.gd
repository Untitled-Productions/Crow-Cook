extends Panel


@export var inv: Inv
@export var item: InvItem

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var timesclicked: int = 0

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
	timesclicked += 1
	Global.pressed = true
	print("true")
	inv.export(item)
	amount_text.text = str(inv.slots[0].amount - timesclicked)
	if !inv.slots[0].item:
		item_visual.texture = null
		item_visual.visible = false
		amount_text.visible = false
		item = null
	else:
		item_visual.visible = true
		if inv.slots[0].amount >= 1:
			item_visual.texture = inv.slots[0].item.texture
		if inv.slots[0].amount > 1:
			amount_text.visible = true
