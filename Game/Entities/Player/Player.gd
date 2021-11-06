extends KinematicBody

#================Variables==============
#--Public
export(int) var Speed = 10
var is_inside_cover_area = false
var cover_area_position = Vector3.ZERO
var cover_side = Global.CoverType.center

#--Private
var covered = false
onready var animation_tree = $MeshPivot/Zach/AnimationTree

#================Public Functions==============
#===================Private Functions================
func _ready():
	$Input.connect("sgn_Space_Key_Pressed", self, "_toggle_cover")
	$Input.connect("sgn_Left_Click_Pressed", self, "_shooting_pressed")
	$Input.connect("sgn_Left_Click_Released", self, "_shooting_released")

func _process(delta):
	if covered:
		global_transform.origin = global_transform.origin.linear_interpolate(cover_area_position, 2*delta)
	else:
		var move_direction = $Input.direction_Strength.normalized()
		move_and_slide(move_direction*Speed, Vector3.UP)
		var vec2D = Vector2(move_direction.x, move_direction.z)
		animation_tree.set("parameters/BlendSpace2D/blend_position", vec2D)

func _shooting_pressed():
	#if animation_tree.get("parameters/Standing/current") == 1:
	var shootanim = animation_tree.get("parameters/Cover/current") 
	animation_tree.set("parameters/Cover/current", shootanim + 1) 
		
	animation_tree.set("parameters/Standing/current", 1)
		
func _shooting_released():
	#if animation_tree.get("parameters/Standing/current") == 0:
	var shootanim = animation_tree.get("parameters/Cover/current") 
	animation_tree.set("parameters/Cover/current", shootanim - 1) 
	
	animation_tree.set("parameters/Standing/current", 0)

func _toggle_cover():
	if is_inside_cover_area:
		covered = !covered
		
		# If in cover then select which side to be on
		if covered:
			match cover_side:
				Global.CoverType.left:
					animation_tree.set("parameters/Cover/current", 0)
				Global.CoverType.right:
					animation_tree.set("parameters/Cover/current", 2)
				Global.CoverType.center:
					animation_tree.set("parameters/Cover/current", 4)
		else:
			animation_tree.set("parameters/Cover/current", 6)
		
		


