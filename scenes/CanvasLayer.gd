extends CanvasLayer

func _process(delta):
	if GlobalVar.vida == 1:
		$AnimationPlayer.play("vida1")
	elif GlobalVar.vida == 2:
		$AnimationPlayer.play("vida2")
	elif GlobalVar.vida == 3:
		$AnimationPlayer.play("vida3")
	elif GlobalVar.vida == 4:
		$AnimationPlayer.play("vida4")
	elif GlobalVar.vida == 5:
		$AnimationPlayer.play("vida5")
	elif GlobalVar.vida == 6:
		$AnimationPlayer.play("vida6")
