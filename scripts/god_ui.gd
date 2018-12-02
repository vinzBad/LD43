extends MarginContainer

export (String) var god_name = "Godname"
export (Texture) var god_texture_angry
export (Texture) var god_texture_content
export (Texture) var god_texture_happy

export (String) var wrath_message = "You didn't manage to please %s. In his anger he brings down his hordes of doom and enslaves humanity" % [god_name]

export (int) var current_mood = 0
export (int) var max_mood = 6

onready var data = get_node("/root/data")

func _ready():
	if god_texture_angry != null:
		$CenterContainer/VBoxContainer/TextureRect.texture = god_texture_angry
	$CenterContainer/VBoxContainer/Label.text = god_name

func _process(delta):
	var selected_items = get_tree().get_nodes_in_group("selected_item")
	if selected_items.size() == 0:
		$CenterContainer/VBoxContainer/Button.disabled = true
	else:
		$CenterContainer/VBoxContainer/Button.disabled = false

func gameover():
	var scene = data.gameover_scene.instance()
	var ui_node = get_node("/root/UI/")
	ui_node.add_child(scene)

func _on_Button_pressed():
	var selected_items = get_tree().get_nodes_in_group("selected_item")
	var text = get_tree().get_nodes_in_group("text")[0]
	if selected_items.size() > 0:
		var item = selected_items[0]
		var reaction = item.reactions[god_name][1]
		var mood_modifier = item.reactions[god_name][0]
		current_mood += mood_modifier
		text.add_text("\n%s: %s" % [god_name, reaction])
		item.queue_free()
		
		if current_mood < 0:
			text.add_text("\n%s" % [wrath_message])
			gameover()
		if current_mood >= max_mood:
			current_mood = max_mood
			$CenterContainer/VBoxContainer/TextureRect.texture = god_texture_happy
		elif current_mood > 0:
			$CenterContainer/VBoxContainer/TextureRect.texture = god_texture_content
		elif current_mood == 0:
			$CenterContainer/VBoxContainer/TextureRect.texture = god_texture_angry
		
