extends Control

func _process(delta):
	GlobalVar.boss_timer = false

func _on_Start_pressed():
	GlobalVar.vida = 5
	GlobalVar.municao = 10
	get_tree().change_scene("res://scenes/FaseUm.tscn")


func _on_Quit_pressed():
	get_tree().quit()
