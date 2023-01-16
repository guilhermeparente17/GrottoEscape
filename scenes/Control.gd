extends Control

func _process(delta):
	$CanvasLayer3/Label.text = str(GlobalVar.municao)
