extends StaticBody2D

var vida = 1
onready var municao = preload("res://scenes/municao.tscn")
onready var capsula_vida = preload("res://scenes/vida.tscn")

func dano():
	vida -= 1
	if vida <= 0:
		$AnimationPlayer.play("destroy")
		
func recompensa():
	var m1 = municao.instance()
	var m2 = municao.instance()
	var m3 = municao.instance()
	var m4 = municao.instance()
	get_parent().add_child(m1)
	get_parent().add_child(m2)
	get_parent().add_child(m3)
	get_parent().add_child(m4)
	m1.global_position = $Positionmunicao1.global_position
	m2.global_position = $Positionmunicao2.global_position
	m3.global_position = $Positionmunicao3.global_position
	m4.global_position = $Positionmunicao4.global_position
	

func destroir():
	GlobalVar.status_caixa = true
	queue_free()
