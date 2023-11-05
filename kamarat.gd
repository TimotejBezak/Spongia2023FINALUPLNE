extends Node2D

signal uvaril_sa(item)
signal zobraz(item_meno)

var dary = ["záhradné rukavice", "sada na cistenie","flaša medoviny"]
@onready var stvorlistok = preload("res://grafika/itemy/stvorlistok.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $pridavac.je_item_na_mne():
		for dar in dary:
			if $pridavac.item_na_mne.meno == dar:
#				var uvarenec = load("res://item_inventaru.tscn").instantiate()
#				uvarenec.meno = "stvorlistok"
#				uvarenec.icon = stvorlistok
#				uvarenec.position = Vector2(900,700)
#				uvarenec.visible = true
#				emit_signal("uvaril_sa",uvarenec)
				emit_signal("zobraz","stvorlistok")
				$Label.text = "dakujem ti za stedry dar, za odmenu ti ponukam tento stvorlistok pre stastie, nezabudni si ho pridat do inventara"
				global.bol_si_u_kamarata = true
				$pridavac.item_na_mne.queue_free()
				$pridavac.visible = false
				break
