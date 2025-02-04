extends Node3D

@export var CubePath = "Prefabs/cube.tscn"
@export var SpawnCooldown = 0.5
@export var MaxCubes = 50

var spawnedCubes: Array[Node3D] = []
var timeToNextSpawn = 0
var cubeLoaded = false
var cubePrefab

func _ready():
	ResourceLoader.load_threaded_request(CubePath)
	timeToNextSpawn = SpawnCooldown

func _process(delta):
	timeToNextSpawn -= delta
	if timeToNextSpawn < 0:
		if !cubeLoaded && ResourceLoader.load_threaded_get_status(CubePath) == ResourceLoader.THREAD_LOAD_LOADED:
			cubePrefab = ResourceLoader.load_threaded_get(CubePath)
			cubeLoaded = true

		if !cubeLoaded:
			return
		if MaxCubes == 0:
			return

		_spawn_cube()
		timeToNextSpawn += SpawnCooldown

func _spawn_cube():
	var cube_instance: Node3D
	if spawnedCubes.size() >= MaxCubes:
		cube_instance = spawnedCubes[0]
		spawnedCubes.remove_at(0)
	else:
		cube_instance = cubePrefab.instantiate()
		get_tree().root.add_child(cube_instance)

	spawnedCubes.append(cube_instance)
	cube_instance.position = global_position
