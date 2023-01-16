extends StaticBody2D

var vida = 13
var posicao_inicial
var posicao_final
var flip = true
const velocidade = 3

var gosma_death = true

func _ready():
	$AnimationPlayer.play("idle")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial - 280
	
func _process(delta) -> void:
	if gosma_death:
		if GlobalVar.status_ataque_boss_gosma:
			if posicao_inicial >= posicao_final and flip:
				$".".position.x -= 3
				$Sprite.flip_h = false
				if $".".position.x <= posicao_final:
					flip = false

			if $".".position.x <= posicao_inicial and !flip:
				$".".position.x += 1.5
				$Sprite.flip_h = true
				if $".".position.x >= posicao_inicial:
					flip = true
					$Sprite.flip_h = false
					GlobalVar.continue_boss = false

func dano():
	vida -= 1
	$AnimationPlayer.play("dano")
	if vida <= 0:
		gosma_death = false
		$Sprite.scale.x = 1
		$Sprite.scale.y = 1
		GlobalVar.para_musica_boss = true
		$AnimationPlayer.play("morte")
		
func audio_morte():
	GlobalVar.boss_timer = true
	$morte.play()
		
func morte():
	queue_free()

func _on_Area2D_body_entered(body) -> void:
	if body.name == "Grotto":
		body.dano()
		

func restart_idle():
	$AnimationPlayer.play("idle")

	
