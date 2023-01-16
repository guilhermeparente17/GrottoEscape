extends Node2D

onready var plataforma = preload("res://scenes/plataforma_false.tscn")
onready var necro = preload("res://scenes/monsters/Necromancer.tscn")
onready var skeleton = preload("res://scenes/monsters/SkeletonInvoker.tscn")
onready var caixa = preload("res://scenes/Caixa.tscn")
var cooldownMonster = true
var audio_boss = true

func _ready():
	$tema.play()
	$caixa.start()

func _process(delta):
	if GlobalVar.status_plataforma:
		var p = plataforma.instance()
		get_parent().add_child(p)
		p.global_position = $Positions/Position_Plataforma.global_position
		GlobalVar.status_plataforma = false
		
		
	if GlobalVar.atack_invoker:
		poder_necro()


func Grotto_body_entered(body):
	if body.name == "Grotto" and cooldownMonster:
		$atack_necromancer.start()
		var n = necro.instance()
		get_parent().add_child(n)
		n.global_position = $Positions/Renascer_Necromante.global_position
		cooldownMonster = false


func _on_atack_necromancer_timeout():
	GlobalVar.invoker = true
	$atack_necromancer.stop()
	
func poder_necro():
	var s = skeleton.instance()
	var s2 = skeleton.instance()
	get_parent().add_child(s)
	get_parent().add_child(s2)
	s.global_position = $Positions/Skeleton1.global_position
	s2.global_position = $Positions/Skeleton2.global_position
	GlobalVar.atack_invoker = false
	



func _on_colisao_inimigo_body_entered(body):
	pass


func _on_escada_body_entered(body):
	if body.name == "Grotto":
		GlobalVar.status_escada = true


func _on_escada_body_exited(body):
	if body.name == "Grotto":
		GlobalVar.status_escada = false
		
func nascer_caixa():
	var c = caixa.instance()
	get_parent().add_child(c)
	c.global_position = $Positions/Pos_Caixa.global_position
	GlobalVar.status_caixa = false


func _on_caixa_timeout():
	if GlobalVar.status_caixa:
		nascer_caixa()

func _on_Inicio_Boss_body_entered(body):
	if body.name == "Grotto":
		GlobalVar.inicio_demon = true
		if audio_boss:
			$tema.stop()
			$audio_boss.play()
			audio_boss = false
