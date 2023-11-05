extends Node2D

signal uvaril_sa(item)
# Called when the node enters the scene tree for the first time.
var recepty = [
	#["vec1","vec3","toto chces","res://grafika/test.png"]
	["stvorlistok","prazdna flasa","elixir stastia","res://grafika/itemy/elixir_stastia.png"],
	["palica","lano","rebrik","res://grafika/itemy/rebrik.png"]
]
var cas_ukazania
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cas_ukazania != null:
		if cas_ukazania <= 0:
			$neda_sa.text = ""
		cas_ukazania -= delta


func _on_uvar_button_down():
	if $pridavac.je_item_na_mne() and $pridavac2.je_item_na_mne():
		var neda_sa = true
		for recept in recepty:
			if ($pridavac.item_na_mne.meno == recept[0] and $pridavac2.item_na_mne.meno == recept[1]) or ($pridavac.item_na_mne.meno == recept[1] and $pridavac2.item_na_mne.meno == recept[0]):
				neda_sa = false
				var uvarenec = load("res://item_inventaru.tscn").instantiate()
				uvarenec.meno = recept[2]
				uvarenec.icon = load(recept[3])
				uvarenec.position = Vector2(1450,500)
				emit_signal("uvaril_sa",uvarenec)
				$pridavac.item_na_mne.queue_free()
				$pridavac2.item_na_mne.queue_free()
				$zvuk.play()
				break
		if neda_sa:
			povedz_info("tieto dve veci sa nedaju zmiesat",1.5)
		
func povedz_info(text,cas):
	cas_ukazania = cas
	$neda_sa.text = text
