extends Panel


@export var inv: Inv

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
	if !slot.amount > 1:
		amount_text.visible = false


func _on_button_pressed():
	var path: String = get_path()
	var inv_idx = int(path.split("inv_UI_slot", true, 2)[1]) - 1
	var slot: InvSlot = inv.slots[inv_idx]
	print("Clicked on slot ", inv_idx, ". Path: ", path)
	if slot.amount > 0:
		# TODO: Use the item somehow
		slot.amount = max(slot.amount - 1, 0)
		if slot.amount == 0:
			slot.item = null
			print("None left!")
		else:
			print(slot.amount, " items left in slot ", inv_idx)
		visuals(slot)
