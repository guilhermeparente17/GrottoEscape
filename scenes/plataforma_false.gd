extends Area2D

var vai_cair = false

func _process(delta):
	if vai_cair:
		cair()
	pass

func _on_plataforma_false_body_entered(body):
	if body.name == "Grotto":
		vai_cair = true


func cair():
	$".".position.y += 1

func _on_VisibilityNotifier2D_screen_exited():
	GlobalVar.status_plataforma = true
	queue_free()
