extends KinematicBody
class_name Player

#================Variables==============
#--Public
export(int) var Speed = 300
export(bool) var fullscreen = false
var is_inside_cover_area = false
var cover_area_position = Vector3.ZERO
var cover_side = Global.CoverType.center

#--Private
var covered = false

#================Public Functions==============
func SetCovered(p_cover:bool, position:Vector3 = Vector3.ZERO, side:int = Global.CoverType.center):
	if p_cover:
		covered = true
		cover_side = side
		$Mesh.get_surface_material(0).albedo_color = Color.green
		#global_transform.origin = position
	else:
		covered = false
		$Mesh.get_surface_material(0).albedo_color = Color.white

#===================Private Functions================
func _ready():
	OS.window_fullscreen = fullscreen
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.Input_ref.connect("sgn_Q_Key_Pressed", self, "_toggle_cover")

func _process(delta):
	if covered:
		global_transform.origin = global_transform.origin.linear_interpolate(cover_area_position, 2*delta)
	else:
		var moveDir = Global.Input_ref.direction_Strength
		move_and_slide(moveDir*Speed*delta, Vector3.UP)

func _toggle_cover():
	if is_inside_cover_area:
		if covered:
			SetCovered(false)
		else:
			SetCovered(true, cover_area_position, cover_side)



