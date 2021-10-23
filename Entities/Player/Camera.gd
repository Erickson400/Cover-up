extends KinematicBody

export(NodePath) var player
#================Variables==============

#================Private Functions==============
func _ready():
	Global.Input_ref.connect("sgn_Left_Click_Pressed", self, "_shoot")
		
func _process(delta):
	var speed = 1000
	var moveDir:Vector3 = Vector3.ZERO
	moveDir = get_node(player).global_transform.origin - global_transform.origin
	move_and_slide(moveDir*delta*speed, Vector3.UP)
	
	Global.Game_ref.get_node("Sprite").position = get_viewport().get_mouse_position()
	
	# Raycast
	var ray_Length = 1000
	var ray_Org = $Camera.project_ray_origin(Vector2.ZERO)
	var ray_End = ray_Org + $Camera.project_ray_normal(get_viewport().get_mouse_position()) * ray_Length
	$Camera/RayCast.cast_to = $Camera.to_local(ray_End)
	
	$Camera/box.global_transform.origin = $Camera/RayCast.get_collision_point()

func _shoot():
	pass
