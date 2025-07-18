extends Panel


@export var inv: Inv
@export var item: InvItem
@export var slots: Array[InvSlot]

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


func _on_button_pressed():
	var emptyslots = slots.filter(func(slot): return slot.item == null)
	print("pressed")
	if !emptyslots.is_empty():
		emptyslots[0].item = null
		emptyslots[0].amount = 0
		print("DESTROYED")
