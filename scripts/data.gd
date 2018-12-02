extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var offerings_data = {}
var offerings_node
var images = {}

var offer_scene = preload("res://item_ui.tscn") 
var gameover_scene = preload("res://gameover_ui.tscn")
var gamesuccess_scene = preload("res://gamesuccess_ui.tscn")


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
   
	
	
func load_images():
	print("loading images")
	var offer_data = {}
	var image_name = ""
	for key in data.offerings_data.keys():
		offer_data  = data.offerings_data[key]
		image_name = offer_data["img"]
		images[image_name] = load("res://assets/" + image_name)
		
	print("loaded %s images" % [images.size()])

	

func load_offerings():
	print("parsing offerings.json")
	var file = File.new()
	file.open("res://data/offerings.json", file.READ)
	var p = JSON.parse(file.get_as_text())
	if typeof(p.result) == TYPE_DICTIONARY:
		offerings_data = p.result
	print("parsed data for %s offerings" % [offerings_data.size()])

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
