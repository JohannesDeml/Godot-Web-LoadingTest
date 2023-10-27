extends Node3D

@export var CubePrefab = preload("res://Prefabs/cube.tscn")
@export var SpawnCooldown = 1.0;
@export var MaxCubes = 50;

var spawnedCubes: Array[Node3D] = [];

var timeToNextSpawn = 0;

func _process(delta):
	timeToNextSpawn -= delta;
	if(timeToNextSpawn < 0):
		_spawnCube()
		timeToNextSpawn += SpawnCooldown;
	pass

func _spawnCube():
	var cubeInstance;
	if(spawnedCubes.size() >= MaxCubes):
		cubeInstance = spawnedCubes[0];
		spawnedCubes.remove_at(0);
	else:
		cubeInstance = CubePrefab.instantiate()
		get_tree().root.add_child(cubeInstance)
	
	spawnedCubes.append(cubeInstance);
	cubeInstance.position = position;
