extends MarginContainer

export (String) var item_name = "Generic Item"
export (String) var item_description = "This is a generic item"

export (Texture) var item_texture

var reactions = {
		"Anias": [0, "Anias neither likes or dislikes this offering"],
		"Rhogorr": [-1, "What is this shit?" ],
		"Nelia": [1, "Nice."]
	}

var selected_color = Color("#ff0000")
var default_color = Color("#FFFFFF")

func _ready():
	add_to_group("items")
	
	if item_texture != null:
		$panel/hbox/center/texture.texture = item_texture
	$panel/hbox/vbox/Name.text = item_name
	$panel/hbox/vbox/Description.text = item_description
	
	set_process(true)
	
func _process(delta):
	pass


func select():
	var selected_items = get_tree().get_nodes_in_group("selected_item")
	for item in selected_items:
		item.unselect()
	add_to_group("selected_item")
	
	$panel.self_modulate = selected_color

func unselect():
	self.remove_from_group("selected_item")
	$panel.self_modulate = default_color

func _input(event):
	pass
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:

#		print("click at: %s -> %s " % [event.position, mouse_pos_local])
		if get_global_rect().has_point(get_global_mouse_position()):
			select()
		





