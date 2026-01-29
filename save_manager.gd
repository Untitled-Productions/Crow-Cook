extends Node

const save_file_name: String = "user://save_file.json"
const default_dictionary: Dictionary = {
	"position": 1195.0 && 537.0
}

@export var SavePos : Vector2

func _ready():
	var dict: Dictionary = load_game()

func save_game(data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	if save_file == null:
		push_error("Error opening file")
		return
	var string_data: String = JSON.stringify(data)
	save_file.store_string(string_data)
	save_file.close()


func load_game() -> Dictionary:
	if FileAccess.file_exists(save_file_name):
		var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.READ)
		if save_file == null:
			push_error("Error reading file")
			return default_dictionary
		var json = JSON.new()
		
		var string_data = save_file.get_line()
		if json.parse(string_data) == OK:
			var data: Dictionary = json.get_data()
			save_file.close()
			return data
		push_error("Corrupted data")
	return default_dictionary

func reset_save() -> void:
	save_game(default_dictionary)

func UpdatePos(value : Vector2):
	SavePos = value
