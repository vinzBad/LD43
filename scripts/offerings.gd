extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("creating offer instances")
	var offer_data = {}
	var counter = 0
	var xoffset = 130
	for key in data.offerings_data.keys():
		offer_data  = data.offerings_data[key]
		var instance = data.offer_scene.instance()
		instance.name = key
		instance.offer_name = offer_data["name"]
		instance.offer_description = offer_data["descr"]
		instance.reactions = offer_data["reactions"]
		instance.texture = data.images[offer_data["img"]]
		
		instance.position.x = counter * xoffset
		counter += 1
		
		add_child(instance)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
