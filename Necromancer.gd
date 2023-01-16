extends StaticBody2D

func _ready():
	$AnimationPlayer.play("nascer")
	$Sprite.flip_h = true
	
func _process(delta):
	if GlobalVar.invoker:
		$AnimationPlayer.play("invoker")
		
	if GlobalVar.show_necro:
		hit()

func reset_animation():
	$AnimationPlayer.play("idle")
	GlobalVar.invoker = false
	
func invokar():
	print("Invokaaaaaaar")
	GlobalVar.atack_invoker = true
	
func hit():
	$AnimationPlayer.play("dead")
	
func morte():
	queue_free()

func audio_nascer():
	$nascer.play()
