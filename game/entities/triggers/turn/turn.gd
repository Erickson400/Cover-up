extends Area

export(Global.TurnSide) var side = Global.TurnSide.right


func _ready():
	hide()


func _on_Turn_body_entered(body):
	if body.is_in_group("player"):
		body.turn(side)
		print("SUS")
		$CollisionShape.disabled = true
		
		
