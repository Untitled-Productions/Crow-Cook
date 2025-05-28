extends Resource

class_name Inv

signal update

@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	update.emit()

func export(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	print("exporting")
	if Global.pressed == true:
		print("emptying")
		Global.pressed = false
		if !itemslots.is_empty():
			itemslots[0].amount -= itemslots[0].amount
			print("empty")
		else:
			var emptyslots = slots.filter(func(slot): return slot.item == null)
			if !emptyslots.is_empty():
				emptyslots[0].item = null
				emptyslots[0].amount = 0
	update.emit()
