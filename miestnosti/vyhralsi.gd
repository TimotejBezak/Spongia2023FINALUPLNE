extends Node2D

@onready var pozadia = [preload("res://miestnosti/endscreen1.png"),preload("res://miestnosti/endscreen2.png")]
@onready var pozadia2 = [preload("res://miestnosti/overlay1.png"),preload("res://miestnosti/overlay2.png"),preload("res://miestnosti/overlay3.png")]
# Called when the node enters the scene tree for the first time.
var idx = 0
var cas = 0
var limit = 0.5
var cas2 = 0
var limit2 = 0.2
var idx2 = 0
func _ready():
	$basnicka.stream = load("res://videa/outro.wav")
	$basnicka.play()
#	$overlay.modulate.a = 0.3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cas += delta
	cas2 += delta
	if cas > limit:
		if idx == 0:
			idx = 1
		else:
			idx = 0
		cas = 0
		$Sprite2D.texture = pozadia[idx]
	if cas2 > limit2:
		if idx2 == 0:
			idx2 = 1
		else:
			if idx2 == 1:
				idx2 = 2
			else:
				idx2 = 0
		cas2 = 0
		$overlay.texture = pozadia2[idx2]
