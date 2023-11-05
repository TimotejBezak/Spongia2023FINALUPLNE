extends Node

#@onready var rozmer_policka_krizovky = 150
# Called when the node enters the scene tree for the first time.
var spravne_heslo_zadane = false
var inventar = []
var sceny_prvy_krat = [-1,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
#var pocet_scen = 14
var mas_nakalibrovanu_palicku = false
var mam_vyriesene_hadanky = false
var veci_ktore_uz_niekedy_boli_v_inventari = []
var zablokovat_presun = false
var nahucal_si = false
var peniaze = 34#00
var bol_si_u_kamarata = false
var mam_hodene_6 = false
var vyliezol_po_rebriku = false
var mas_otvorene_noviny = false
var vypity_elixir_stastia = false
var hra_basnicka = false
var stvorlistok_dostavas = true
var sal_dostavas = true
var rukavice_dostavas = true
var uspesne_pockanie = false
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#todo:
# x inventar
# x vytvorit vsetky sceny miestnosti
# x tlacidla na presun medzi miestnostami
# x animacia presunu
# x tlacidlo na zobrazenie knihy
# x scena 1 - balenie veci - tuknem na vec a da sa do inventara
# x scena varenie domysliet - miesam dve suroviny a nieco mi z toho vznikne, suroviny sa nespotrebuju
# x scena pamet - dostanes nakalibrovanu palicku
# x scena sadenie - zasadis semienka krompacu/rebrika a instante sa premenia na danu vec
# scena rebrik - pouzitim rebriku ziskas XX
# scena krompac - nemozes ist dalej, kym nepouzijes krompac
# scena cakanie - ked pockas, dostanes XX
# scena rev - prisera sa od strachu pokaka a vypadne z nej priserie hovienko, ktore si mozes zobrat do inventaru
# scena kamarat - musis mu dat darcek, dostanes XX
# x scena heslo - tlacidla posunu sa odomknu az po zadani hesla
# x scena stastie
# x scena hadanky domysliet
# x osemsmerovka
# x sudoku
# x zadavanie hesla
# lodicky  hrozne komplikovane bude tam kopa bugov, nerobim

# mozne bugy:
# scena 4 neexistuje
# krizovka pismenka
# itemy musia byt rovnako velke
# tuknem na plusove tlacidlo, otvori sa mi inventar, omodria itemy v nom. Ked teraz pridam dalsi item do inventara, nebude omodreny

#bugy:
# x ked nezoberies itemy, uz ich nenajdes ked sa po ne vratis
# z sceny 3 naspet treba ist na 48
# vycentrovat label itemu inventara
# x ked uvaris veci, mohli by zmiznut suroviny z ktorych si to navaril
# ked si od kamarata nezoberies stvorlistok a pojdes prec, ked sa vratis uz tam neni

#todo:
# x ked porazis priseru vypari sa a ukaze sa text, ze si porazil priseru
# nemozes ist na dalsiu scenu kym si nevypocujes basnicku
# kniznica duch bublina
# nakupovac
# domysliet texty na tlacidlach presunu
# obchodnik nech ma bublinu, ze kabat stoji 500
# moznost znova si vypocut basnicky
# truhlica sa otvori ked zadas heslo
# hudba nech nejde od zaciatku na kazdej snimke
# ikonky presunu
# sudoku male cisla zvecsit
# ak mas vypity elixir, budes o tom vediet v scene nahoda, nech mas istotu, ze tie 6 teraz hodis ovela rychlejsie
# varenie nech ti vypise ze tieto dve suroviny sa nedaju zmiesat
# ked pridavacom nieco pridas, nech sa zavrie inventar


# itemy:
# semienka rebrika
# rebrik
# prazdna flasa
# stvorlistok
# elixir stastia
# kabat
# rukavice
# sal
# sada na cistenie
# palica

# v dome mas: semienka rebrika, prazdna flasa, sada na cistenie, palica


# detaily:
# tlacidla nech su ine ked mys hoveruje

# co treba otestovat:
# zvuk varenie
# hudbu, aj hlasitosti
# elixir stastia

#debug opravy
# prisera - nastavit potrebny zvuk na odplasenie na povodny
# miestnost.gd nech nevies ist dalej kym si nevypocujes basnicku
