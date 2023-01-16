extends Control

func _process(delta):
	
	$CanvasLayer/Label.text = "Vida: " + str(GlobalVar.vida)
