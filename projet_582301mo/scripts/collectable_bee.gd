extends Node

@export var collectable_bees = 0
signal collectable_bee_collected

var objectif_collectable_bees_level_2 = 4

signal honeybucket_collected

func unlock_portal(portal):
	honeybucket_collected.emit(portal)


func add_collectable_bees():
	collectable_bees += 1
	collectable_bee_collected.emit(collectable_bees)

func change_scene(new_scene:PackedScene):
	print("change scene")
	get_tree().call_deferred("change_scene_to_packed", new_scene)
