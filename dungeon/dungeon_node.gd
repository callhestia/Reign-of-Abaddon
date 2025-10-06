extends Node2D

var type
var num_of_turns

var layer
var pos_in_layer
var connections := []

var unlocked = false

func _process(delta: float) -> void:
	# For example, you can make unlocked nodes glow or pulse
	if unlocked:
		modulate = Color(1, 1, 1)  # normal color
	else:
		modulate = Color(0.5, 0.5, 0.5)  # greyed out


func _input_event(viewport, event, shape_idx):
	# This function is automatically called when you click a node with a CollisionShape2D
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if unlocked:
				on_click_unlocked()
			else:
				print("This node is locked!")


func on_click_unlocked():
	print("Clicked unlocked node at layer %d, position %d" % [layer, pos_in_layer])
	var parent = get_parent()
	if parent and parent.has_method("update_player_position"):
		parent.update_player_position(self)
	# Here you can do anything:
	# - unlock connected nodes
	# - show UI
	# - load next level, etc.
		
		
func update_visual_state():
	# Change color or sprite depending on lock state
	if unlocked:
		modulate = Color(1, 1, 1)
	else:
		modulate = Color(0.5, 0.5, 0.5)
