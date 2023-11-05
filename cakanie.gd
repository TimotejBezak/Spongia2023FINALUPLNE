extends Node2D

signal uvaril_sa(item)
signal zobraz(item_meno)
# Called when the node enters the scene tree for the first time.
var cas_cakania = 5#15#3*60
var hotovo = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cas_cakania -= delta
	if !hotovo:
		if cas_cakania <= 0:
			hotovo = true
#			var uvarenec = load("res://item_inventaru.tscn").instantiate()
#			uvarenec.meno = "rukavice"
#			uvarenec.icon = load("res://grafika/itemy/rukavice.png")
#			uvarenec.position = Vector2(1400,500)
#			emit_signal("uvaril_sa",uvarenec)
			emit_signal("zobraz","rukavice")
			global.uspesne_pockanie = true
			global.peniaze += 250
