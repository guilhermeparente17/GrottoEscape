extends Control

func _process(delta):
	$CanvasLayer/Label.text = "Munição: " + str(GlobalVar.municao)
