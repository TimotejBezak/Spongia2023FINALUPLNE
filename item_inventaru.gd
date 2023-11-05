extends Button

signal pridat_do_inventaru(item)
signal item_sa_sunie_do_sceny(item)
signal item_sa_dosunul_do_sceny(item)
signal vypilsa()

@export var meno: String
var je_v_scene = true
var cestuje = false
var cielovy_pos = [1850,10]
var pridavaci_mod = false
var kam_do_sceny_pridat
var cestuje_do_sceny = false
var diakritika = {
	"sal" : "šál",
	"stvorlistok" : "štvorlístok",
	"sada na cistenie" : "sada na čistenie",
	"prazdna flasa" : "prázdna fľasa",
	"elixir stastia" : "elixír štastia",
	"rebrik" : "rebrík"
}
var visible_minule
# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D.scale.x = float(float(icon.get_width()+8)/float($Node2D/highlight.texture.get_width()))
	$Node2D.scale.y = float(float(icon.get_height()+8)/float($Node2D/highlight.texture.get_height()))
	if meno == "elixir stastia":
		var vypit = load("res://vypit.tscn").instantiate()
		vypit.connect("vypilsa",vypilsa1)
		add_child(vypit)
		vypit.position = Vector2(10,100)
	modulate.a = 1
	if global.bol_si_u_kamarata and meno == "stvorlistok":
		visible = true
	if global.spravne_heslo_zadane and meno == "sal":
		visible = true
	if global.uspesne_pockanie and meno == "rukavice":
		visible = true
	visible_minule = visible
	#print($Node2D.scale.x,"  ",icon.get_width(),"  ",$Node2D/highlight.texture.get_width(),"  ",$Node2D.scale.x*$Node2D/highlight.texture.get_width())

func vypilsa1():
	global.vypity_elixir_stastia = true
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v = 1700
	if cestuje:
		var kam = Vector2(cielovy_pos[0]-position.x,cielovy_pos[1]-position.y)#[cielovy_pos[0]-position.x,cielovy_pos[1]-position.y]
		var smer = kam.normalized()
		position += smer*v*delta
		if abs(position.x - cielovy_pos[0]) < 60:
			position = Vector2(cielovy_pos[0],cielovy_pos[1])
			cestuje = false
			emit_signal("pridat_do_inventaru",self)
	if cestuje_do_sceny:
		#print(kam_do_sceny_pridat)
		var kam = Vector2(kam_do_sceny_pridat[0]-position.x,kam_do_sceny_pridat[1]-position.y)#[cielovy_pos[0]-position.x,cielovy_pos[1]-position.y]
		var smer = kam.normalized()
		position += smer*v*delta
		#print(kam_do_sceny_pridat,position)
		if abs(position.x - kam_do_sceny_pridat[0]) < 60:
			position = Vector2(kam_do_sceny_pridat[0],kam_do_sceny_pridat[1])
			cestuje_do_sceny = false
			pridavaci_mod = false
			kam_do_sceny_pridat = null
			je_v_scene = true
			emit_signal("item_sa_dosunul_do_sceny",self)
	$Node2D.visible = pridavaci_mod
	
	if visible and !visible_minule:
		if meno == "stvorlistok" and global.stvorlistok_dostavas:
			modulate.a = 0
			global.stvorlistok_dostavas = false
		if meno == "sal" and global.sal_dostavas:
			modulate.a = 0
			global.sal_dostavas = false
		if meno == "rukavice" and global.rukavice_dostavas:
			modulate.a = 0
			global.rukavice_dostavas = false
	if meno == "stvorlistok" or meno == "rukavice" or meno == "sal":
		modulate.a = min(1,modulate.a+delta/5)

func _on_button_down():
	if !global.mas_otvorene_noviny:
		if !cestuje and !cestuje_do_sceny:
			$Label.text = ""
			if je_v_scene:
				cestuje = true
			else:
				if pridavaci_mod:
					#print("cestuje_do_sceny")
					cestuje_do_sceny = true
					kam_do_sceny_pridat[1] -= 25
					kam_do_sceny_pridat[0] -= (icon.get_width()-50)/2
#					print(position,"pos")
					emit_signal("item_sa_sunie_do_sceny",self)


func _on_mouse_entered():
	if meno in diakritika:
		$Label.text = diakritika[meno]
	else:
		$Label.text = meno

func _on_mouse_exited():
	$Label.text = ""

