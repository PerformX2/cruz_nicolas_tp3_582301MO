extends Control
class_name HUD

@export var collectable_bee_label : Label
@export var portal_label : Label

func update_collectable_bee_label(number : int):
	collectable_bee_label.text = "x " + str(number)

func portal_opened():
	portal_label.text = "PORTAL OPENED ! "

func portal_closed():
	portal_label.text = "PORTAL CLOSED... GET COLLECTABLE BEES!"
