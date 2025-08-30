extends Resource

class_name Inv

signal update

var rng = RandomNumberGenerator.new()
var random_int = rng.randi_range(2, 4)

@export var slots: Array[InvSlot]

func _ready():
	randomize()

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	rng.randi()
	if !itemslots.is_empty():
		if !item.name == "apple":
			itemslots[0].amount += 1
		else:
			itemslots[0].amount += random_int
			random_int = rng.randi_range(2, 4)
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			if !item.name == "apple":
				emptyslots[0].amount = 1
			else:
				emptyslots[0].amount += random_int
				random_int = rng.randi_range(2, 4)
	update.emit()
