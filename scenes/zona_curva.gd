extends Area2D

# Mantém aqui o caminho que já copiaste e colaste
var proxima_cena := "res://main2.tscn"
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
	carro.set_physics_process(false) # tira o controlo ao jogador
	var sprite = carro.get_node("Sprite2D")

	# Camada preta para o fade
	var camada := CanvasLayer.new()
	camada.layer = 100
	var fade := ColorRect.new()
	fade.color = Color(0, 0, 0, 0)
	fade.size = get_viewport_rect().size
	camada.add_child(fade)
	get_tree().current_scene.add_child(camada)

	# Animação: avança, sobe, encolhe, vira um pouco e escurece
	var t := create_tween()
	t.set_parallel(true)
	t.tween_property(carro, "position", carro.position + Vector2(350, -120), 1.2) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	t.tween_property(sprite, "scale", sprite.scale * 0.6, 1.2)
	t.tween_property(sprite, "rotation_degrees", -8.0, 1.2)
	t.tween_property(fade, "color:a", 1.0, 0.5).set_delay(0.8)
	await t.finished

	get_tree().change_scene_to_file(proxima_cena)
