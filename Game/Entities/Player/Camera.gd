extends KinematicBody

#====================Variables==================
#--Public
export(NodePath) var player
var collision_point:Vector3 = Vector3.ZERO

#--Private

#=====================Signals===================
signal sgn_shoot_start
signal sgn_shoot_end

#================Public Functions==============
func switch_direction(new_angle):
	rotation_degrees.y = new_angle

#================Private Functions==============
func _process(delta):
	# Smoothly move the camera towards the player
	var lerp_speed = 4
	var move_direction:Vector3 = Vector3.ZERO
	if player:
		move_direction = get_node(player).global_transform.origin - global_transform.origin
	else:
		move_direction = self.global_transform.origin
	move_and_slide(move_direction*lerp_speed, Vector3.UP)
	
	# Raycast
	var ray_length = 1000
	var ray_org = $Camera.project_ray_origin(Vector2.ZERO)
	var ray_end = ray_org + $Camera.project_ray_normal(get_viewport().get_mouse_position()) * ray_length
	$Camera/RayCast.cast_to = $Camera.to_local(ray_end)
	collision_point = $Camera/RayCast.get_collision_point()

func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		emit_signal("sgn_shoot_start")
	if event.is_action_released("left_click"):
		emit_signal("sgn_shoot_end")





