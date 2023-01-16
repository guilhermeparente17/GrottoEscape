extends CanvasLayer

func _process(delta):
	$CanvasLayer2/Label.text = str(GlobalVar.municao)
