extends Node

#==================Enums==================
enum CoverType{
	left, # Left side of the level (wall on left)
	center,
	right # Right side of the level (wall on right)
}

func _ready():
	OS.window_fullscreen = false
	Engine.target_fps = 20
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	


