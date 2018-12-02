tool
extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var data = get_node("/root/data")

func _ready():
	
	
	data.load_offerings()
	data.load_images()
	var offer_data = {}
	for key in data.offerings_data.keys():
		offer_data  = data.offerings_data[key]
		var instance = data.offer_scene.instance()
		instance.name = key
		instance.item_name = offer_data["name"]
		instance.item_description = offer_data["descr"]
		instance.reactions = offer_data["reactions"]
		instance.item_texture = data.images[offer_data["img"]]
		
		
		
		add_child(instance)

func _process(delta):
	if get_child_count() == 0:
		var scene = data.gamesuccess_scene.instance()
		var ui_node = get_node("/root/UI/")
		ui_node.add_child(scene)

func _input(event):
	if Input.is_action_just_released("reload"):
		get_tree().reload_current_scene()

