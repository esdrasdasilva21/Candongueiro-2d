extends Area2D

@export_file("*.tscn") var proxima_cena := "res://rua2.tscn"
var ativo := false

func _physics_process(_delta):
	if ativo:
		return
	for corpo in get_overlapping_bodies():
		if corpo.is_in_group("carro"):
			var na_faixa_cima = abs(corpo.position.y - corpo.y_faixa_cima) < 5.0
			if na_faixa_cima:
				ativo = true
				_fazer_curva(corpo)
			return

func _fazer_curva(carro):
	print("CURVA DISPAROU!")
	carro.set_physics_process(false)
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file(proxima_cena)
