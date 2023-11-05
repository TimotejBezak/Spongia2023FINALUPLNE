extends Node2D

var cas_ukazania
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cas_ukazania != null:
		if cas_ukazania <= 0:
			$neda_sa.text = ""
		cas_ukazania -= delta


func _on_hrat_button_down():
	if $AudioStreamPlayer2D.is_playing() == false:
		get_tree().change_scene_to_file("res://miestnosti//1.tscn")
	else:
		povedz_info("vypocuj si basnicku",1.5)
		
func povedz_info(text,cas):
	cas_ukazania = cas
	$neda_sa.text = text
