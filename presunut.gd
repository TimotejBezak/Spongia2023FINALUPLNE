extends Button

signal stlacene_tlacidlo_presunut()

@export var kam: int
var popis = [-1, "izba","les","kamarát","predajna kabatov","elixíry","zahrada","palicka","ist dalej","jaskyna","ist dalej","rebrik","kniznica","nahoda","cakanie","doprava","dolava","doprava","dolava","dolava","rovno","doprava","doprava","rovno","dolava","dolava","dolava","dolava","doprava","doprava","doprava","dolava","doprava","rovno","dolava","rovno","doprava","dolava","doprava","rovno","dolava","doprava","rovno","doprava","rovno","dolava","rovno","doprava","dolava","rovno","vyhrat"]
var ikony = ["res://grafika/ikony/icon.png","res://grafika/ikony/home.png","res://grafika/ikony/ikona_les.png","res://grafika/ikony/kamarat_ikona.png","res://grafika/ikony/obchod_ikona.png","res://grafika/ikony/ikona_elixir.png","res://grafika/ikony/zahrada_ikona.png","res://grafika/ikony/kancel_ikona.png","res://grafika/ikony/jaskyna3_ikona.png","res://grafika/ikony/jaskyna1_ikona.png","res://grafika/ikony/jaskyna2_ikona.png","res://grafika/ikony/icon.png","res://grafika/ikony/kniznica1_ikona.png","res://grafika/ikony/kniznica2_ikona.png","res://grafika/ikony/kniznica3_ikona.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png","res://grafika/ikony/icon.png"]

# Called when the node enters the scene tree for the first time.
var cas
var limit = 1.2
var cas_ukazania
var som_tlacidlo_naspet = false
var uz_som_vyhral = false
func _ready():
	if popis[kam] == "dolava" or popis[kam] == "doprava" or popis[kam] == "rovno":
		if popis[kam] == "dolava":
			icon = load("res://grafika/ikony/dolava.png")
		if popis[kam] == "doprava":
			icon = load("res://grafika/ikony/doprava.png")
		if popis[kam] == "rovno":
			icon = load("res://grafika/ikony/rovno.png")
	else:
		icon = load(ikony[kam])
	$Label.text = popis[kam]
	if som_tlacidlo_naspet and kam > 14:
		$Label.text = "naspet"
	$Label.visible = false
		
	if kam == 9 or kam == 12:
		visible = global.bol_si_u_kamarata

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cas != null:
		cas += delta
		if cas >= limit:
			get_tree().change_scene_to_file("res://miestnosti//"+str(kam)+".tscn")
			#print(global.sceny[kam])
			#get_tree().change_scene_to_packed(global.sceny[kam])
			
	if cas_ukazania != null:
		if cas_ukazania <= 0:
			$neda_sa.text = ""
		cas_ukazania -= delta
		
#	if global.vyhral_si and !uz_som_vyhral:
#		uz_som_vyhral = true
#		cas = 0
		#emit_signal("stlacene_tlacidlo_presunut")
#func _on_button_down():
#	cas = 0
#	print("tuk")
#	emit_signal("presun")


func _on_button_down():
	if global.hra_basnicka:
		povedz_info("najprv si vypocuj basnicku",1.5)
	if !global.zablokovat_presun and !global.mas_otvorene_noviny and !global.hra_basnicka:
		var pokracujem = true
		if kam == 9 and !global.mas_nakalibrovanu_palicku:#jaskyna
			pokracujem = false
			povedz_info("carodejnik sa do jaskyne bez nakalibrovanej palicky neodvazi",3)
		if kam == 13 and !global.mam_vyriesene_hadanky:
			pokracujem = false
			povedz_info("este si neodpovedal na hadanky",3)
		if kam == 14 and !global.mam_hodene_6:
			pokracujem = false
			povedz_info("duch ta nepusti dalej kym nehodis tri sestky",3)
#		if kam == 9 and !global.spravne_heslo_zadane:
#			pokracujem = false
#			povedz_info("najprv zadaj heslo",3)
		if kam == 8 and !global.vyliezol_po_rebriku:
			pokracujem = false
			povedz_info("bez rebriku sa dalej nedostanes",3)
		if kam == 10 and !global.nahucal_si:
			pokracujem = false
			povedz_info("prisera ti stoji v ceste",3)
		
		if pokracujem:
			cas = 0
			emit_signal("stlacene_tlacidlo_presunut")
	#get_tree().change_scene("res://miestnosti//"+str(kam)+".tscn")

func povedz_info(text,cas):
	cas_ukazania = cas
	$neda_sa.text = text



func _on_mouse_entered():
	$Label.visible = true


func _on_mouse_exited():
	$Label.visible = false
