extends Panel


@export var inv: Inv

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var grabbed = false

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
		if grabbed == false:
			Global.mouseani.sprite_frames.remove_frame("item", 0)
			Global.mouseani.sprite_frames.add_frame("item", slot.item.texture)
			Global.mouseani.item = slot.item
			if slot.amount > 1:
				Global.mouseani.mouse_amount.visible = true
				Global.mouseani.mouse_amount.text = str(slot.amount)
			grabbed = true
		if slot.amount > 0 and grabbed == true:
			slot.amount = max(slot.amount - 1, 0)
			grabbed = false
			Global.mouseani.mouse_amount.visible = false
			visuals(slot)
		if slot.amount == 0:
			slot.item.texture = null
			slot.item = null
			print("None left!")
			visuals(slot)
		else:
			print(slot.amount, " items left in slot ", inv_idx)
		visuals(slot)
	if slot.amount == 0:
		slot.item = Global.mouseani.item
		slot.amount += 1
		Global.mouseani.item = null
		Global.mouseani.sprite_frames.remove_frame("item", 0)
		visuals(slot)
	if slot.amount > 0 and grabbed == true:
		slot.amount += 1
		Global.mouseani.item = null
		Global.mouseani.sprite_frames.remove_frame("item", 0)
		visuals(slot)
