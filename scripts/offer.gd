extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (String) var offer_name = "Generic Offering"
export (String) var offer_description = "This is a generic offering"


var reactions = {
		"Anias": [0, "Anias neither likes or dislikes this offering"],
		"Rhogorr": [-1, "What is this shit?" ],
		"Nelia": [1, "Nice."]
	}

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func  get_reaction_text(god):
	if god in reactions:
		return reactions[god][1]
	else:
		return ""

func get_reaction_value(god):
	if god in reactions:
		return reactions[god][0]
	else:
		return 0