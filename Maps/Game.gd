extends Node

func _enter_tree():
	Global.Game_ref = get_tree().get_root().get_node("Game")
	Global.Input_ref = Global.Game_ref.get_node("Input")
