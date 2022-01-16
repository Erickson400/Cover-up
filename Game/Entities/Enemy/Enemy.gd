extends KinematicBody

#==================Variables==================
const DIRECTIONS = [
	Vector3.ZERO,
	Vector3.ZERO,
	Vector3.ZERO,
	Vector3.ZERO,
	Vector3.RIGHT,
	Vector3.RIGHT,
	Vector3.RIGHT,
	Vector3.LEFT,
	Vector3.LEFT,
	Vector3.LEFT,
	Vector3.FORWARD,
	Vector3.BACK
]
var speed = 2
var active_direction = Vector3.ZERO


#==================Public Functions==================
# Must be called when instanced
func init(dir:Vector3):
	active_direction = dir


#==================Private Functions==================
# warning-ignore:unused_argument
func _process(delta):
# warning-ignore:return_value_discarded
	move_and_slide(active_direction*speed, Vector3.UP)




func _on_DirectionSwitch_timeout():
	active_direction = DIRECTIONS[randi() % DIRECTIONS.size()]

func _on_SpawnMove_timeout():
	self._on_DirectionSwitch_timeout()
	$DirectionSwitch.start()

