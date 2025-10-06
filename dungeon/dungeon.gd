extends Node2D

var stage := 4
var dungeon_node = preload("res://dungeon/dungeon_node.tscn")
var dungeon_layer = preload("res://dungeon/layer.tscn")
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
var dungeon_node_textures = [
	preload("res://graphics/dun_node_1.png"),
	preload("res://graphics/dun_node_2.png"),
	preload("res://graphics/dun_node_3.png")
]
<<<<<<< HEAD
=======
>>>>>>> e09fe3d (working dungeon system)
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
var number_of_layers
var dungeon_height = 648
var dungeon_width = 1152

var positions_in_layer := []
var layers_of_positions := []

var nodes_in_layer := []
var layers_of_nodes := []

var starting_pos_in_lay = 3

<<<<<<< HEAD
<<<<<<< HEAD
var player_position := Vector2(-1, 3)
=======
var player_position := Vector2(0, 3)
>>>>>>> e09fe3d (working dungeon system)
=======
var player_position := Vector2(-1, 3)
>>>>>>> 54eabbb (semi-dzialajaca gra)


#func new_dungeon(stage):
func _ready():
	gen_new_dungeon(stage)
	lock_and_unlock_nodes(player_position)

func gen_new_dungeon(st):
	number_of_layers = st + 3
	var height_of_layer = dungeon_height / number_of_layers
	var pos_x_diff = dungeon_width / 5
	for layer in range(number_of_layers): # od dolu do gory
		var pos_y = dungeon_height - height_of_layer / 2 - layer * height_of_layer
		#var new_layer = dungeon_layer.instantiate()
		positions_in_layer = []
		nodes_in_layer = []
		if layer == 0 or layer == number_of_layers-1:
			var new_node = gen_new_node(st, pos_x_diff * starting_pos_in_lay - pos_x_diff/2, pos_y, starting_pos_in_lay, layer)
			positions_in_layer.append(starting_pos_in_lay)
			nodes_in_layer.append(new_node)
			add_child(new_node)
		else:
			var num_of_nodes = min(5, layers_of_positions[layer-1].size() * (randi() % 2 + 1))
			while num_of_nodes > 0:
				var position_in_layer = randi() % 5
				for position in layers_of_positions[layer-1]:
					if abs(position - position_in_layer) <= 1:
						var new_node = gen_new_node(st, pos_x_diff * position_in_layer + pos_x_diff/2, pos_y, position_in_layer, layer)
						positions_in_layer.append(position_in_layer)
						nodes_in_layer.append(new_node)
						add_child(new_node)
						num_of_nodes = num_of_nodes - 1
		
		layers_of_positions.append(positions_in_layer)
		layers_of_nodes.append(nodes_in_layer)
	make_connections_between_layers()

func lock_and_unlock_nodes(player_pos):
	var curr_node = null
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
	var connections
	if player_pos.x != -1:
		for node in layers_of_nodes[player_pos.x]:
			if node.pos_in_layer == player_pos.y:
				curr_node = node
		connections = curr_node.connections
<<<<<<< HEAD
	for layer in layers_of_nodes:
		for node in layer:
			node.unlocked = false
	if player_pos.x != -1 and player_pos.x != layers_of_nodes.size() - 1:
		for node in layers_of_nodes[player_pos.x + 1]:
			if node.pos_in_layer in connections:
				node.unlocked = true
	elif player_pos.x == -1:
		for node in layers_of_nodes[0]:
			node.unlocked = true
	else:
		print("you win")
=======
	for node in layers_of_nodes[player_pos.x]:
		if node.pos_in_layer == player_pos.y:
			curr_node = node
	var connections = curr_node.connections
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
	for layer in layers_of_nodes:
		for node in layer:
			node.unlocked = false
	if player_pos.x != -1 and player_pos.x != layers_of_nodes.size() - 1:
		for node in layers_of_nodes[player_pos.x + 1]:
			if node.pos_in_layer in connections:
				node.unlocked = true
	elif player_pos.x == -1:
		for node in layers_of_nodes[0]:
			node.unlocked = true
<<<<<<< HEAD
>>>>>>> e09fe3d (working dungeon system)
=======
	else:
		print("you win")
>>>>>>> 54eabbb (semi-dzialajaca gra)
	

func make_connections_between_layers():
	for layer in range(0, number_of_layers-1):
		for curr_node in layers_of_nodes[layer]:
			var curr_pos_in_lay = curr_node.pos_in_layer
			for next_node in layers_of_nodes[layer+1]:
				var next_pos_in_lay = next_node.pos_in_layer
				if abs(curr_pos_in_lay - next_pos_in_lay) <= 1:
					curr_node.connections.append(next_pos_in_lay)
					var line = create_line(curr_node.position.x, curr_node.position.y, next_node.position.x, next_node.position.y)
					add_child(line)
			if curr_node.connections.size() == 0:
				var closest_node = null
				var closest_range = 99
				var next_pos_in_layer
				for next_node in layers_of_nodes[layer+1]:
					next_pos_in_layer = next_node.pos_in_layer
					var curr_range = abs(curr_pos_in_lay - next_pos_in_layer)
					if (closest_range > curr_range):
						closest_range = curr_range
						closest_node = next_node
				curr_node.connections.append(next_pos_in_layer)
				var line = create_line(curr_node.position.x, curr_node.position.y, closest_node.position.x, closest_node.position.y)
				add_child(line)
					

func create_line(curr_x, curr_y, next_x, next_y):
	var line = Line2D.new()
	line.width = 3
	line.default_color = Color.WHITE
<<<<<<< HEAD
<<<<<<< HEAD
	line.z_index = -1
=======
>>>>>>> e09fe3d (working dungeon system)
=======
	line.z_index = -1
>>>>>>> 54eabbb (semi-dzialajaca gra)
	
	line.points = [
		Vector2(curr_x, curr_y),
		Vector2(next_x, next_y)
	]
	return line

func gen_new_node(st, pos_x, pos_y, pos_in_lay, layer):
	var num_of_turns = randi() % 6 + 4 - st
	var type = randi() % 3
	var new_dungeon_node = dungeon_node.instantiate()
	
	new_dungeon_node.num_of_turns = num_of_turns
	new_dungeon_node.type = type
	
	new_dungeon_node.pos_in_layer = pos_in_lay
	new_dungeon_node.layer = layer
	new_dungeon_node.position = Vector2(pos_x, pos_y)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
	new_dungeon_node.get_node("Sprite2D").texture = dungeon_node_textures[randi() % dungeon_node_textures.size()]
	new_dungeon_node.get_node("Sprite2D").scale = Vector2(0.4, 0.4)
	return new_dungeon_node

func update_player_position(node):
	var fight_scene = preload("res://board/board.tscn").instantiate()
	
	# Pass variable from dungeon to fight
	fight_scene.boss = false
	if node.layer == layers_of_nodes.size() - 1:
		fight_scene.boss = true
	var blocker = ColorRect.new()
	blocker.color = Color(0, 0, 0, 0) # fully transparent
	blocker.mouse_filter = Control.MOUSE_FILTER_STOP
	blocker.size = get_viewport_rect().size
	add_child(blocker)
	blocker.move_to_front()
	get_tree().current_scene.add_child(fight_scene)
	blocker.queue_free()
<<<<<<< HEAD
=======
	return new_dungeon_node

func update_player_position(node):
>>>>>>> e09fe3d (working dungeon system)
=======
>>>>>>> 54eabbb (semi-dzialajaca gra)
	var player_pox_x = node.layer
	var player_pox_y = node.pos_in_layer

	player_position = Vector2(player_pox_x, player_pox_y)
	lock_and_unlock_nodes(player_position)
