extends Area2D

var chosen = false
var glow_color: Color = Color(1, 1, 0.5)
var original_modulate: Color
var offset = 20
enum CardType { MIXTURE_DMG, MIXTURE_HEAL, MIXTURE_DRAW, MINION, ARSENAL }
var card_type = CardType.MINION
var value = 2

func _ready():
	original_modulate = $Sprite2D.modulate
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
				$Sprite2D.modulate = original_modulate
			else:
				var board = get_parent().get_parent()
				if board and board.has_method("change_chosen_card"):
					board.change_chosen_card(self)

func make_chosen():
	$Sprite2D.modulate = glow_color
	chosen = true

func make_unchosen():
	$Sprite2D.modulate = original_modulate
	chosen = false

func _on_mouse_entered():
	position.y = position.y - offset
	scale.x = 1.8
	scale.y = 1.8
	z_index = 10 


func _on_mouse_exited():
	position.y = position.y + offset
<<<<<<< HEAD
<<<<<<< HEAD
	scale.x = 1
	scale.y = 1
=======
	scale.x = 0.8
	scale.y = 0.8
>>>>>>> 5565602 (fight)
=======
	scale.x = 1
	scale.y = 1
>>>>>>> 25048fd (dzialajaca gra)
	z_index = 0
