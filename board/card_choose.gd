extends Area2D


<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
enum CardType { MIXTURE_DMG, MIXTURE_HEAL, MIXTURE_DRAW, MINION, ARSENAL }

var chosen = true
var value = 0
var card_type
<<<<<<< HEAD
=======
var chosen = true
>>>>>>> 5565602 (fight)
=======
>>>>>>> 25048fd (dzialajaca gra)

func _ready():
	$Line2D.visible = false
	$Line2D2.visible = false
<<<<<<< HEAD
<<<<<<< HEAD
	$value.text = str(value)
=======
>>>>>>> 5565602 (fight)
=======
	$value.text = str(value)
>>>>>>> 25048fd (dzialajaca gra)

func _input_event(viewport, event, shape_idx):
	# This function is automatically called when you click a node with a CollisionShape2D
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if chosen:
				chosen = false
				$Line2D.visible = true
				$Line2D2.visible = true
				print("clicked")
			else:
				chosen = true
				$Line2D.visible = false
				$Line2D2.visible = false
