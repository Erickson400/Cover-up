extends Area

export(Global.CoverType) var cover_side = Global.CoverType.center	

func _ready():
	hide()

func _on_CoverSpotCenter_body_entered(body):
	if body.name == "Player":
		body.cover_side = cover_side
		body.cover_area_position = global_transform.origin
		body.is_inside_cover_area = true

func _on_CoverSpotCenter_body_exited(body):
	if body.name == "Player":
		body.is_inside_cover_area = false



