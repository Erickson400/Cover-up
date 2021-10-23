extends Node

#==================Variables==================
var direction_Strength:Vector3

#==================Signals==================
signal sgn_Left_Click_Pressed
signal sgn_Right_Click_Pressed
signal sgn_Escape_Key_Pressed

signal sgn_Left_Click_Released
signal sgn_Right_Click_Released
signal sgn_Escape_Key_Released

signal sgn_Q_Key_Pressed

#==================Unhandled Input Check==================
func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		emit_signal("sgn_Left_Click_Pressed")
	if event.is_action_pressed("right_click"):
		emit_signal("sgn_Right_Click_Pressed")
	if event.is_action_pressed("ui_cancel"):
		emit_signal('sgn_Escape_Key_Pressed')
	if event.is_action_pressed("Cover"):
		emit_signal('sgn_Q_Key_Pressed')
	
	if event.is_action_released("left_click"):
		emit_signal("sgn_Left_Click_Released")
	if event.is_action_released("right_click"):
		emit_signal("sgn_Right_Click_Released")
	if event.is_action_released("ui_cancel"):
		emit_signal('sgn_Escape_Key_Released')
		get_tree().quit()
	
	direction_Strength = Vector3()
	direction_Strength.z = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	direction_Strength.x = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")

