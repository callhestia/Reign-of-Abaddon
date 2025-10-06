extends Node2D

<<<<<<< HEAD
<<<<<<< HEAD
var curr_health = 5

func _ready():
	$Label.text = str(curr_health)
<<<<<<< HEAD
=======
var curr_health
>>>>>>> 5565602 (fight)
=======
var curr_health = 5
>>>>>>> 25048fd (dzialajaca gra)
=======
>>>>>>> 4266328 (skonczona gra)

func _input_event(viewport, event, shape_idx):
	# This function is automatically called when you click a node with a CollisionShape2D
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var board = get_parent()
			if board and board.has_method("clicked_boss"):
				board.clicked_boss(self)
<<<<<<< HEAD
<<<<<<< HEAD

func deal_enemy_dmg(dmg):
	curr_health = curr_health - dmg
	$Label.text = str(curr_health)
	if curr_health <= 0:
		return true
	return false
=======
>>>>>>> 5565602 (fight)
=======

func deal_enemy_dmg(dmg):
	curr_health = curr_health - dmg
	$Label.text = str(curr_health)
	if curr_health <= 0:
		return true
	return false
>>>>>>> 25048fd (dzialajaca gra)
