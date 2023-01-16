extends StaticBody2D

var vida = 15
var posicao_inicial
var posicao_final
var flip = true
const velocidade = 3

func _ready():
	$AnimationPlayer.play("atack")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial - 380
	
func _process(delta):
	if GlobalVar.inicio_demon:
		animations()
		if posicao_inicial >= posicao_final and flip:
			$".".position.x -= 1.5
			$Sprite.flip_h = false
			$Fire/Sprite.flip_h = false
			$Fire.position.x = -73
			if $".".position.x <= posicao_final:
				flip = false

		if $".".position.x <= posicao_inicial and !flip:
			$".".position.x += 1.5
			$Sprite.flip_h = true
			$Fire/Sprite.flip_h = true
			$Fire.position.x = 73
			if $".".position.x >= posicao_inicial:
				flip = true
				$Sprite.flip_h = false
	else:
		$AnimationPlayer.play("idle")
		$Fire/Sprite.hide()
		$Fire/AnimationPlayer.stop()
	
func dano():
	vida -= 1

func animations():
	if vida == 15:
		$AnimationPlayer.play("atack")
	elif vida == 10:
		$AnimationPlayer.play("atack_movement")
	elif vida == 5:
		$AnimationPlayer.play("atack_movement_3")
		$Fire.type_anim = "blue"
	elif vida <= 0:
		$AnimationPlayer.play("dead")
		$Fire/AnimationPlayer.stop()
		$Fire/Sprite.hide()
	
func fire():
	$audio_fogo.play()
	$Fire/AnimationPlayer.play($Fire.type_anim)
	$Fire/Sprite.show()
	
func disable_fire():
	$audio_fogo.stop()
	$Fire/AnimationPlayer.stop()
	$Fire/Sprite.hide()


func morte():
	queue_free()
