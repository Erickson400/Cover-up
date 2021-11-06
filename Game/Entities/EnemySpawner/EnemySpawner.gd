extends Spatial

#============Variables================
var enemy_scn = preload("res://Game/Entities/Enemy/Enemy.tscn")
var spawn_running_speed = 4

#============Public Functions================
func spawn_enemy():
	var spawn_direction = global_transform.basis.x
	var enemy_inst = enemy_scn.instance()
	enemy_inst.init(spawn_direction*spawn_running_speed)
	add_child(enemy_inst)



#============Private Functions================

func _ready():
	spawn_enemy()

func _on_SpawnRate_timeout():
	spawn_enemy()
