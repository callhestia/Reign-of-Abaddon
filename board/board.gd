extends Node2D

var card_placeholder = preload("res://board/card_placeholder.tscn")
var card_choose = preload("res://board/card_choose.tscn")
var card_on_hand = preload("res://board/card_on_hand.tscn")

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
var textures = [
	preload("res://graphics/a_czar.png"),
	preload("res://graphics/a_czar2.png"),
	preload("res://graphics/a_czar3.png"),
	preload("res://graphics/a_skel.png"),
	preload("res://graphics/a_skel2.png"),
	preload("res://graphics/a_skel3.png"),
	preload("res://graphics/a_skel4.png"),
	preload("res://graphics/a_war.png"),
	preload("res://graphics/a_war2.png"),
	preload("res://graphics/a_war3.png")
]

var poison_texture = preload("res://graphics/posion.png")
var heal_texture = preload("res://graphics/heal.png")
var draw_texture = preload("res://graphics/draw.png")

var arsenal_textures = [
	preload("res://graphics/axe2.png"),
	preload("res://graphics/sztylet.png")
]

var default_icon = preload("res://icon.svg")

<<<<<<< HEAD
=======
>>>>>>> 5565602 (fight)
=======
>>>>>>> 25048fd (dzialajaca gra)
var turn = 1 # 1 = player, 0 = enemy

var max_number_of_turns = 6
var turns_left = 6
var board_width = 1152.0
var number_of_card_placeholders = 5
var x_difference_between_cards
var x_offset_troops = 100

var num_cards_to_choose = 5

var cards_on_hand := []
var cards_to_choose := []

var card_on_hand_and_chosen

enum CardType { MIXTURE_DMG, MIXTURE_HEAL, MIXTURE_DRAW, MINION, ARSENAL }
enum EnemyMove { MIXTURE_DMG, MIXTURE_HEAL, MINION, ARSENAL }

var hand_size = 7

<<<<<<< HEAD
<<<<<<< HEAD
var boss: bool

=======
>>>>>>> 5565602 (fight)
=======
var boss: bool

>>>>>>> 25048fd (dzialajaca gra)
func _ready():
	board_width = board_width - x_offset_troops*2
	x_difference_between_cards = board_width/number_of_card_placeholders
	add_enemy_cards_placeholders()
	add_player_cards_placeholders()
	turns_left = max_number_of_turns
	player_choose_cards()
<<<<<<< HEAD
<<<<<<< HEAD
	$number_of_turns_left.text = "Turns left " + str(turns_left)

func player_choose_cards():
	$player_choose.visible = true
	$end_fight_earlier.visible = false
	$end_round.visible = false
	$turn.visible = false
=======
	$number_of_turns_left.text = str(turns_left)


func player_choose_cards():
	$player_choose.visible = true
>>>>>>> 5565602 (fight)
=======
	$number_of_turns_left.text = "Turns left " + str(turns_left)

func player_choose_cards():
	$player_choose.visible = true
	$end_fight_earlier.visible = false
	$end_round.visible = false
	$turn.visible = false
>>>>>>> 25048fd (dzialajaca gra)
	$ColorRect.color = Color(0.0, 0.0, 0.0, 0.5)
	$ColorRect.visible = true
	$ColorRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var x_difference_between_cards_choose = board_width/num_cards_to_choose
	for i in range(num_cards_to_choose):
<<<<<<< HEAD
<<<<<<< HEAD
		var card_x = x_difference_between_cards_choose * i + x_difference_between_cards_choose/2 + x_offset_troops
		var new_card_choose = card_choose.instantiate()
		new_card_choose.position = Vector2(card_x, 0)
		new_card_choose.card_type = CardType.values()[randi() % EnemyMove.size()]
		new_card_choose.value = randi() % 4 + 1
		if new_card_choose.card_type == CardType.MINION:
			var texture = textures[randi() % textures.size()]
			new_card_choose.get_node("Sprite2D").texture = texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_HEAL:
			new_card_choose.get_node("Sprite2D").texture = heal_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_DMG:
			new_card_choose.get_node("Sprite2D").texture = poison_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_DRAW:
			new_card_choose.get_node("Sprite2D").texture = draw_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.ARSENAL:
			new_card_choose.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_HEAL:
			new_card_choose.get_node("Sprite2D").texture = heal_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		else:
			print(new_card_choose.card_type)
			new_card_choose.get_node("Sprite2D").texture = default_icon
=======
		var card_x = x_difference_between_cards_choose * i + x_difference_between_cards_choose/2
		var new_card_choose = card_choose.instantiate()
		new_card_choose.position = Vector2(card_x, 0)
>>>>>>> 5565602 (fight)
=======
		var card_x = x_difference_between_cards_choose * i + x_difference_between_cards_choose/2 + x_offset_troops
		var new_card_choose = card_choose.instantiate()
		new_card_choose.position = Vector2(card_x, 0)
		new_card_choose.card_type = CardType.values()[randi() % EnemyMove.size()]
		new_card_choose.value = randi() % 4 + 1
		if new_card_choose.card_type == CardType.MINION:
			var texture = textures[randi() % textures.size()]
			new_card_choose.get_node("Sprite2D").texture = texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_HEAL:
			new_card_choose.get_node("Sprite2D").texture = heal_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_DMG:
			new_card_choose.get_node("Sprite2D").texture = poison_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_DRAW:
			new_card_choose.get_node("Sprite2D").texture = draw_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.ARSENAL:
			new_card_choose.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_choose.card_type == CardType.MIXTURE_HEAL:
			new_card_choose.get_node("Sprite2D").texture = heal_texture
			new_card_choose.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		else:
			print(new_card_choose.card_type)
			new_card_choose.get_node("Sprite2D").texture = default_icon
>>>>>>> 25048fd (dzialajaca gra)
		cards_to_choose.append(new_card_choose)
		$player_choose.add_child(new_card_choose)
	var btn = $player_choose/Button
	btn.position = Vector2(x_difference_between_cards_choose * 2 + x_difference_between_cards_choose/2, 100)
	
	
	
func add_enemy_cards_placeholders():
	for i in range(number_of_card_placeholders):
		var pos_x = x_difference_between_cards * i + x_difference_between_cards/2 + x_offset_troops
		var new_card_placeholder = card_placeholder.instantiate()
		new_card_placeholder.position = Vector2(pos_x, 0)
		new_card_placeholder.enemy = true
		new_card_placeholder.place = i
		$enemy_troops.add_child(new_card_placeholder)


func add_player_cards_placeholders():
	for i in range(number_of_card_placeholders):
		var pos_x = x_difference_between_cards * i + x_difference_between_cards/2 + x_offset_troops
		var new_card_placeholder = card_placeholder.instantiate()
		new_card_placeholder.position = Vector2(pos_x, 0)
		new_card_placeholder.enemy = false
		new_card_placeholder.place = i
		$player_troops.add_child(new_card_placeholder)


func _on_button_pressed() -> void:
	for i in range(num_cards_to_choose):
		if cards_to_choose[i].chosen == false:
			var old_card = cards_to_choose[i]
			var new_card_placeholder = card_choose.instantiate()
			new_card_placeholder.position = old_card.global_position
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
			new_card_placeholder.card_type = CardType.values()[randi() % EnemyMove.size()]
			new_card_placeholder.value = randi() % 4 + 1
			if new_card_placeholder.card_type == CardType.MINION:
				var texture = textures[randi() % textures.size()]
				new_card_placeholder.get_node("Sprite2D").texture = texture
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			elif new_card_placeholder.card_type == CardType.MIXTURE_HEAL:
				new_card_placeholder.get_node("Sprite2D").texture = heal_texture
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			elif new_card_placeholder.card_type == CardType.MIXTURE_DMG:
				new_card_placeholder.get_node("Sprite2D").texture = poison_texture
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			elif new_card_placeholder.card_type == CardType.MIXTURE_DRAW:
				new_card_placeholder.get_node("Sprite2D").texture = draw_texture
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			elif new_card_placeholder.card_type == CardType.ARSENAL:
				new_card_placeholder.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			elif new_card_placeholder.card_type == CardType.MIXTURE_HEAL:
				new_card_placeholder.get_node("Sprite2D").texture = heal_texture
				new_card_placeholder.get_node("Sprite2D").scale = Vector2(0.1, 0.1)
			else:
				new_card_placeholder.get_node("Sprite2D").texture = default_icon
<<<<<<< HEAD
=======
>>>>>>> 5565602 (fight)
=======
>>>>>>> 25048fd (dzialajaca gra)
			cards_to_choose[i] = new_card_placeholder
			old_card.queue_free()
	for card in cards_to_choose:
		var new_card_on_hand = card_on_hand.instantiate()
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
		new_card_on_hand.value = card.value
		new_card_on_hand.position = card.position
		new_card_on_hand.card_type = card.card_type
		new_card_on_hand.get_node("Sprite2D").texture = card.get_node("Sprite2D").texture
<<<<<<< HEAD
=======
		new_card_on_hand.position = card.position
>>>>>>> 5565602 (fight)
=======
>>>>>>> 25048fd (dzialajaca gra)
		cards_on_hand.append(new_card_on_hand)
		$player_hand.add_child(new_card_on_hand)
	$player_choose.visible = false
	$ColorRect.visible = false
	$ColorRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
<<<<<<< HEAD
<<<<<<< HEAD
	$end_fight_earlier.visible = true
	$end_round.visible = true
	$turn.visible = true
=======
>>>>>>> 5565602 (fight)
=======
	$end_fight_earlier.visible = true
	$end_round.visible = true
	$turn.visible = true
>>>>>>> 25048fd (dzialajaca gra)
	arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
	
func arrange_cards_in_hand(cards: Array, center_pos: Vector2, spacing: float = 100.0, max_angle: float = 12.0, max_height: float = 50.0):
	var n = cards.size()
	if n == 0:
		return
	# Calculate start index relative to center
	for i in range(n):
		var t = i / float(n - 1) if n > 1 else 0.5  # t goes from 0 (left) to 1 (right)

		# Horizontal position: spread cards evenly around center
		var x_offset = lerp(-spacing * (n-1)/2, spacing * (n-1)/2, t)

		# Vertical position: peak in the middle, lower on the sides (parabola)
		var y_offset = -4 * max_height * (t - 0.5) * (t - 0.5) + max_height

		# Rotation: tilt cards to the sides
		var angle = lerp(-max_angle, max_angle, t)

		# Apply to card
		var card = cards[i]
		card.position = center_pos + Vector2(x_offset, -y_offset)
		card.rotation_degrees = angle
<<<<<<< HEAD
<<<<<<< HEAD
		card.get_node("Sprite2D").scale = Vector2(0.2, 0.2)
=======
>>>>>>> 5565602 (fight)
=======
		card.get_node("Sprite2D").scale = Vector2(0.2, 0.2)
>>>>>>> 25048fd (dzialajaca gra)
		print(card.global_position.x, card.global_position.y)

func change_chosen_card(node):
	if card_on_hand_and_chosen == null:
		card_on_hand_and_chosen = node
		card_on_hand_and_chosen.make_chosen()
	else:
		card_on_hand_and_chosen.make_unchosen()
		card_on_hand_and_chosen = node
		card_on_hand_and_chosen.make_chosen()
	
func clicked_placeholder(node):
	if card_on_hand_and_chosen != null and turn == 1:
		if card_on_hand_and_chosen.card_type == CardType.MINION and node.is_occupied == false and node.enemy == false:
			node.is_occupied = true
			node.get_node("Minion").visible = true
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
			node.get_node("Minion").texture = card_on_hand_and_chosen.get_node("Sprite2D").texture
			node.get_node("Minion").scale = Vector2(0.18, 0.18)
			node.set_stats(card_on_hand_and_chosen.value)
			node.stats = card_on_hand_and_chosen.value
			node.max_stats = card_on_hand_and_chosen.value
<<<<<<< HEAD
=======
>>>>>>> 5565602 (fight)
=======
>>>>>>> 25048fd (dzialajaca gra)
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		elif card_on_hand_and_chosen.card_type == CardType.ARSENAL and node.is_occupied == true and node.have_weapon == false and node.enemy == false:
			node.is_occupied = true
			node.get_node("Arsenal").visible = true
<<<<<<< HEAD
<<<<<<< HEAD
			node.get_node("Arsenal").texture = card_on_hand_and_chosen.get_node("Sprite2D").texture
			node.get_node("Arsenal").scale = Vector2(0.18, 0.18)
			node.weapon_stats = card_on_hand_and_chosen.value
=======
>>>>>>> 5565602 (fight)
=======
			node.get_node("Arsenal").texture = card_on_hand_and_chosen.get_node("Sprite2D").texture
			node.get_node("Arsenal").scale = Vector2(0.18, 0.18)
			node.weapon_stats = card_on_hand_and_chosen.value
>>>>>>> 25048fd (dzialajaca gra)
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		elif card_on_hand_and_chosen.card_type == CardType.MIXTURE_HEAL and node.is_occupied == true and node.enemy == false:
			# node.strength += card_on_hand_and_chosen.value
<<<<<<< HEAD
<<<<<<< HEAD
			node.healing(card_on_hand_and_chosen.value)
=======
>>>>>>> 5565602 (fight)
=======
			node.healing(card_on_hand_and_chosen.value)
>>>>>>> 25048fd (dzialajaca gra)
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		elif card_on_hand_and_chosen.card_type == CardType.MIXTURE_DMG and node.is_occupied == true and node.enemy == true:
<<<<<<< HEAD
<<<<<<< HEAD
			node.deal_dmg(card_on_hand_and_chosen.value)
=======
>>>>>>> 5565602 (fight)
=======
			node.deal_dmg(card_on_hand_and_chosen.value)
>>>>>>> 25048fd (dzialajaca gra)
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		elif card_on_hand_and_chosen.card_type == CardType.MIXTURE_DRAW:
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			var n_cards = card_on_hand_and_chosen.value
			for i in range(n_cards):
				if hand_size > cards_on_hand.size():
					var new_card_on_hand = card_on_hand.instantiate()
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 25048fd (dzialajaca gra)
					new_card_on_hand.card_type = CardType.values()[randi() % EnemyMove.size()]
					new_card_on_hand.value = randi() % 4 + 1
					if new_card_on_hand.card_type == CardType.MINION:
						var texture = textures[randi() % textures.size()]
						new_card_on_hand.get_node("Sprite2D").texture = texture
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
						new_card_on_hand.get_node("Sprite2D").texture = heal_texture
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					elif new_card_on_hand.card_type == CardType.MIXTURE_DMG:
						new_card_on_hand.get_node("Sprite2D").texture = poison_texture
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					elif new_card_on_hand.card_type == CardType.MIXTURE_DRAW:
						new_card_on_hand.get_node("Sprite2D").texture = draw_texture
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					elif new_card_on_hand.card_type == CardType.ARSENAL:
						new_card_on_hand.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
						new_card_on_hand.get_node("Sprite2D").texture = heal_texture
						new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
					else:
						new_card_on_hand.get_node("Sprite2D").texture = default_icon
<<<<<<< HEAD
					cards_on_hand.append(new_card_on_hand)
					$player_hand.add_child(new_card_on_hand)
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
func clicked_boss(node):
	if card_on_hand_and_chosen != null and turn == 1:
		if card_on_hand_and_chosen.card_type == CardType.MIXTURE_DMG:
			var is_boss_dead = node.deal_enemy_dmg(card_on_hand_and_chosen.value)
			if (is_boss_dead):
				you_win()
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))

#EnemyMove { MIXTURE_DMG, MIXTURE_HEAL, MINION, ARSENAL }
func enemy_move():
	$turn.text = "Enemy Turn"
=======
=======
>>>>>>> 25048fd (dzialajaca gra)
					cards_on_hand.append(new_card_on_hand)
					$player_hand.add_child(new_card_on_hand)
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
func clicked_boss(node):
	if card_on_hand_and_chosen != null and turn == 1:
		if card_on_hand_and_chosen.card_type == CardType.MIXTURE_DMG:
			var is_boss_dead = node.deal_enemy_dmg(card_on_hand_and_chosen.value)
			if (is_boss_dead):
				you_win()
			cards_on_hand.erase(card_on_hand_and_chosen)
			card_on_hand_and_chosen.queue_free()
			arrange_cards_in_hand(cards_on_hand, Vector2(0,80))

#EnemyMove { MIXTURE_DMG, MIXTURE_HEAL, MINION, ARSENAL }
func enemy_move():
<<<<<<< HEAD
>>>>>>> 5565602 (fight)
=======
	$turn.text = "Enemy Turn"
>>>>>>> 25048fd (dzialajaca gra)
	print("Starting...")
	await get_tree().create_timer(1.0).timeout
	print("1 second later!")
	var moved = false
	var move
	var value
	while not moved:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 4266328 (skonczona gra)
		var special_attack
		if boss:
			if randi() % 4 == 0:
				special_attack = true
<<<<<<< HEAD
		move = EnemyMove.values()[randi() % EnemyMove.size()]
		if special_attack:
			print("trying SPECIAL ATTACK")
			var how_many_left = 2
			var children = $player_hand.get_children()
			while how_many_left > 0:
				var random_card_pos = randi() % children.size()
				var card_to_remove = children[random_card_pos]
				cards_on_hand.erase(card_to_remove)
				card_to_remove.queue_free()
				arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
				how_many_left = how_many_left - 1
				print("moved SPECIAL ATTACK")
			moved = true
		elif move == EnemyMove.MIXTURE_DMG:
=======
		move = EnemyMove.values()[randi() % EnemyMove.size()]
		if move == EnemyMove.MIXTURE_DMG:
>>>>>>> 5565602 (fight)
=======
		move = EnemyMove.values()[randi() % EnemyMove.size()]
		if special_attack:
			print("trying SPECIAL ATTACK")
			var how_many_left = 2
			var children = $player_hand.get_children()
			while how_many_left > 0:
				var random_card_pos = randi() % children.size()
				var card_to_remove = children[random_card_pos]
				cards_on_hand.erase(card_to_remove)
				card_to_remove.queue_free()
				arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
				how_many_left = how_many_left - 1
				print("moved SPECIAL ATTACK")
			moved = true
		elif move == EnemyMove.MIXTURE_DMG:
>>>>>>> 4266328 (skonczona gra)
			print("trying MIXTURE DMG")
			value = randi() % 3 + 1
			var children = $player_troops.get_children()
			var num_of_children = 0
			for child in children:
				if child.is_occupied:
					num_of_children = num_of_children + 1
			if num_of_children > 0:
				var random_child = randi() % num_of_children
				var child_node = children[random_child]
				if child_node.is_occupied == true:
					if child_node.stats > 0:
						child_node.stats = child_node.stats - value
						moved = true
						print("moved MIXTURE DMG")
		elif move == EnemyMove.MIXTURE_HEAL:
			print("trying MIXTURE HEAL")
			value = randi() % 2 + 1
			var children = $enemy_troops.get_children()
			var num_of_children = 0
			for child in children:
				if child.is_occupied:
					num_of_children = num_of_children + 1
			if num_of_children > 0:
				var random_child = randi() % num_of_children
				var child_node = children[random_child]
				if child_node.is_occupied == true:
					if child_node.stats < child_node.max_stats:
						child_node.stats = child_node.stats + value
						if child_node.stats > child_node.max_stats:
							child_node.stats = child_node.max_stats
						moved = true
						print("moved MIXTURE_HEAL")
		elif move == EnemyMove.ARSENAL:
			print("trying ARSENAL")
			value = randi() % 4 + 1
			var children = $enemy_troops.get_children()
			var num_of_children = 0
			for child in children:
				if child.is_occupied:
					num_of_children = num_of_children + 1
			if num_of_children > 0:
				var random_child = randi() % num_of_children
				var child_node = children[random_child]
				if child_node.is_occupied == true:
					if child_node.have_weapon == false:
						child_node.weapon_stats = value
						child_node.have_weapon = true
						child_node.get_node("Arsenal").visible = true
<<<<<<< HEAD
<<<<<<< HEAD
						child_node.get_node("Arsenal").texture = arsenal_textures[randi() % arsenal_textures.size()]
						child_node.get_node("Arsenal").scale = Vector2(0.18, 0.18)
=======
>>>>>>> 5565602 (fight)
=======
						child_node.get_node("Arsenal").texture = arsenal_textures[randi() % arsenal_textures.size()]
						child_node.get_node("Arsenal").scale = Vector2(0.18, 0.18)
>>>>>>> 25048fd (dzialajaca gra)
						moved = true
					# VISIBLE ARSENALrandom_child.
						print("moved ARSENAL")
		elif move == EnemyMove.MINION:
			print("trying MINION")
			value = randi() % 2 + 1
			var children = $enemy_troops.get_children()
			var num_of_children = 0
			for child in children:
				if child.is_occupied:
					num_of_children = num_of_children + 1
			if num_of_children < number_of_card_placeholders:
				var random_child = randi() % (number_of_card_placeholders - num_of_children)
				var child_node = children[random_child]
				if child_node.is_occupied == false:
<<<<<<< HEAD
<<<<<<< HEAD
					child_node.set_stats(value)
					child_node.is_occupied = true
					child_node.get_node("Minion").visible = true
					child_node.get_node("Minion").texture = textures[randi() % textures.size()]
					child_node.get_node("Minion").scale = Vector2(0.18, 0.18)
					moved = true
					print("moved MINION")
	turn = 1
	$turn.text = "Your Turn"
	turns_left = turns_left - 1
	if turns_left == 0:		
		fight()
	else:
		var new_card_on_hand = card_on_hand.instantiate()
		new_card_on_hand.card_type = CardType.values()[randi() % EnemyMove.size()]
		new_card_on_hand.value = randi() % 4 + 1
		if new_card_on_hand.card_type == CardType.MINION:
			var texture = textures[randi() % textures.size()]
			new_card_on_hand.get_node("Sprite2D").texture = texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
			new_card_on_hand.get_node("Sprite2D").texture = heal_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_DMG:
			new_card_on_hand.get_node("Sprite2D").texture = poison_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_DRAW:
			new_card_on_hand.get_node("Sprite2D").texture = draw_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.ARSENAL:
			new_card_on_hand.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
			new_card_on_hand.get_node("Sprite2D").texture = heal_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		else:
			new_card_on_hand.get_node("Sprite2D").texture = default_icon
		cards_on_hand.append(new_card_on_hand)
		arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		$player_hand.add_child(new_card_on_hand)
	$number_of_turns_left.text = "Turns left " + str(turns_left)


func fight():
	turn = 0
	$turn.text = "Fight"
	var minions = $player_troops.get_children()
	var enemy_minions = $enemy_troops.get_children()
	for i in range(minions.size()):
		if minions[i].is_occupied:
			if enemy_minions[i].is_occupied:
				await get_tree().create_timer(0.5).timeout
				var difference = minions[i].stats + minions[i].weapon_stats - enemy_minions[i].stats - enemy_minions[i].weapon_stats
				enemy_minions[i].stats = enemy_minions[i].stats - minions[i].stats + enemy_minions[i].weapon_stats - minions[i].weapon_stats
				minions[i].stats = difference
			if minions[i].stats > 0 and $Enemy.curr_health > 0:
				await get_tree().create_timer(0.5).timeout
				$Enemy.curr_health = $Enemy.curr_health - minions[i].stats
	if $Enemy.curr_health > 0:
		you_lose()
	else:
		you_win()

func you_lose():
	get_tree().change_scene_to_file("res://dungeon/dungeon.tscn")
func you_win():
	queue_free()



func _on_end_round_pressed() -> void:
	if turn == 1:
		turn = 0
		enemy_move()


func _on_end_fight_earlier_pressed() -> void:
	if turn == 1:
		fight()
=======
					child_node.stats = value
=======
					child_node.set_stats(value)
>>>>>>> 25048fd (dzialajaca gra)
					child_node.is_occupied = true
					child_node.get_node("Minion").visible = true
					child_node.get_node("Minion").texture = textures[randi() % textures.size()]
					child_node.get_node("Minion").scale = Vector2(0.18, 0.18)
					moved = true
					print("moved MINION")
	turn = 1
	$turn.text = "Your Turn"
	turns_left = turns_left - 1
	if turns_left == 0:		
		fight()
	else:
		var new_card_on_hand = card_on_hand.instantiate()
		new_card_on_hand.card_type = CardType.values()[randi() % EnemyMove.size()]
		new_card_on_hand.value = randi() % 4 + 1
		if new_card_on_hand.card_type == CardType.MINION:
			var texture = textures[randi() % textures.size()]
			new_card_on_hand.get_node("Sprite2D").texture = texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
			new_card_on_hand.get_node("Sprite2D").texture = heal_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_DMG:
			new_card_on_hand.get_node("Sprite2D").texture = poison_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_DRAW:
			new_card_on_hand.get_node("Sprite2D").texture = draw_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.ARSENAL:
			new_card_on_hand.get_node("Sprite2D").texture = arsenal_textures[randi() % arsenal_textures.size()]
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		elif new_card_on_hand.card_type == CardType.MIXTURE_HEAL:
			new_card_on_hand.get_node("Sprite2D").texture = heal_texture
			new_card_on_hand.get_node("Sprite2D").scale = Vector2(0.25, 0.25)
		else:
			new_card_on_hand.get_node("Sprite2D").texture = default_icon
		cards_on_hand.append(new_card_on_hand)
		arrange_cards_in_hand(cards_on_hand, Vector2(0,80))
		$player_hand.add_child(new_card_on_hand)
	$number_of_turns_left.text = "Turns left " + str(turns_left)

<<<<<<< HEAD
		
>>>>>>> 5565602 (fight)
=======

func fight():
	turn = 0
	$turn.text = "Fight"
	var minions = $player_troops.get_children()
	var enemy_minions = $enemy_troops.get_children()
	for i in range(minions.size()):
		if minions[i].is_occupied:
			if enemy_minions[i].is_occupied:
				await get_tree().create_timer(0.5).timeout
				var difference = minions[i].stats + minions[i].weapon_stats - enemy_minions[i].stats - enemy_minions[i].weapon_stats
				enemy_minions[i].stats = enemy_minions[i].stats - minions[i].stats + enemy_minions[i].weapon_stats - minions[i].weapon_stats
				minions[i].stats = difference
			if minions[i].stats > 0 and $Enemy.curr_health > 0:
				await get_tree().create_timer(0.5).timeout
				$Enemy.curr_health = $Enemy.curr_health - minions[i].stats
	if $Enemy.curr_health > 0:
		you_lose()
	else:
		you_win()

func you_lose():
	get_tree().change_scene_to_file("res://dungeon/dungeon.tscn")
func you_win():
	queue_free()



func _on_end_round_pressed() -> void:
	if turn == 1:
		turn = 0
		enemy_move()


func _on_end_fight_earlier_pressed() -> void:
	if turn == 1:
		fight()
>>>>>>> 25048fd (dzialajaca gra)
