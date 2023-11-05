extends Node2D
#@export var r: int
#@export var s: int
signal stlacene(p)
signal uvaril_sa(item)
signal zobraz(item_meno)

@onready var policko = preload("res://krizovka//policko.tscn")
@onready var grid = get_node("GridContainer")
@onready var mys_je_dnu = false
var selected: Button
var cas_od_selectu = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in grid.get_children():
		i.connect("stlacene",selectuj)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var heslo = ["1","6","3","3","2"]
	if $GridContainer/policko.label_pismeno.text == "1" and $GridContainer/policko2.label_pismeno.text == "6" and $GridContainer/policko3.label_pismeno.text == "3" and $GridContainer/policko4.label_pismeno.text == "3" and $GridContainer/policko5.label_pismeno.text == "2" and !global.spravne_heslo_zadane:
		global.spravne_heslo_zadane = true
		global.peniaze += 250
		$Label.text = "zadal si spravne heslo, v truhlici si nasiel 250 penazi a zimny sal"
		$zvuk.play()
#		var uvarenec = load("res://item_inventaru.tscn").instantiate()
#		uvarenec.meno = "sal"
#		uvarenec.icon = load("res://grafika/itemy/sal.png")
#		uvarenec.position = Vector2(1400,500)
#		emit_signal("uvaril_sa",uvarenec)
		emit_signal("zobraz","sal")
		$Truhlica.texture = load("res://grafika/truhlica_otvorena.png")
		
	cas_od_selectu += delta
	if cas_od_selectu > 0.2:
		if Input.is_action_just_pressed("lave_mys"):
#			print("tuk", selected)
			#if mys_je_dnu == false:
			if selected != null:
				selected.icon = selected.obrazok[selected.typ]#
			selected = null

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if selected != null:
				var pismeno = event.keycode
				if pismeno >= 48 and pismeno <= 48+9:
					print(selected.label_pismeno.text)
					selected.label_pismeno.text = char(pismeno)
				if pismeno == KEY_BACKSPACE:
					selected.label_pismeno.text = ""
				#if pismeno == MOUSE_BUTTON_LEFT:
				#	print("bu")S
				#	selected = null
#	if event is InputEventMouseButton:
#		if event.pressed:#event.button_index == 0 and 
#			if mys_je_dnu == false:
#				selected = null

func selectuj(p):
	cas_od_selectu = 0
	if selected != null:
		selected.icon = selected.obrazok[selected.typ]
	if p.typ != 2:
		selected = p
		p.icon = p.obrazok_select[p.typ]
	else:
		selected = null


func _on_grid_container_mouse_entered():
	mys_je_dnu = true


func _on_grid_container_mouse_exited():
	mys_je_dnu = false
