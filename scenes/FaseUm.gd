extends Node2D

var status_audio_boss = false
onready var municao = preload("res://scenes/municao.tscn")

func _ready():
	$tema.play()
	$boss_death.start()
	pass
	
func _process(delta):
	print(GlobalVar.status_ataque_boss_gosma)
	pass

func _on_Area_ataque_boss_body_entered(body) -> void:
	if body.name == "Grotto":
		GlobalVar.status_ataque_boss_gosma = true


func _on_Area2D_body_entered(body) -> void:
	if body.name == "Grotto":
		GlobalVar.ataque_boss = true
		$tema.stop()
		if !status_audio_boss:
			$recargaMunicao.start()
			$AudioBoss.play()
			status_audio_boss = true

func _on_boss_death_timeout():
	if GlobalVar.boss_timer:
		get_tree().change_scene("res://scenes/FaseDois.tscn")
		$boss_death.stop()


func recarga_municao_timeout():
	var m = municao.instance()
	get_parent().add_child(m)
	m.global_position = $municaoBaixo.global_position
