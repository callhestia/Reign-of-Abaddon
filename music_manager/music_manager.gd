extends Node

var music_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	
	# Load and play your music once when the game starts
	var music = load("res://music_manager/HorrorDrone1.mp3")  # Change to your MP3 path
	music_player.stream = music
	music_player.play()
	
	# Enable looping
	if music_player.stream:
		music_player.stream.loop = true
