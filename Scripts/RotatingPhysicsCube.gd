extends CharacterBody3D

@export var rotationAxis: Vector3
@export var degreesPerSecond = 90

func _physics_process(delta):
	rotate(rotationAxis, deg_to_rad(degreesPerSecond * delta))
