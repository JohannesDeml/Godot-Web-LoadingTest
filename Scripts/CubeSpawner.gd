extends Node3D

@export var CubePath = "Prefabs/cube.tscn"
@export var SpawnCooldown = 1.0;
@export var MaxCubes = 50;


var spawnedCubes: Array[Node3D] = [];

var timeToNextSpawn = 0;
var cubeLoaded = false;
var cubePrefab;

func _ready():
	ResourceLoader.load_threaded_request(CubePath)
	timeToNextSpawn = SpawnCooldown;

func _process(delta):
	timeToNextSpawn -= delta;
	if(timeToNextSpawn < 0):
		if(!cubeLoaded && ResourceLoader.load_threaded_get_status(CubePath) == 3):  # THREAD_LOAD_LOADED
			cubePrefab = ResourceLoader.load_threaded_get(CubePath)
			cubeLoaded = true;
		
		if(!cubeLoaded):
			# Wait for loading to finish
			pass;
		_spawnCube()
		timeToNextSpawn += SpawnCooldown;
	pass

func _spawnCube():	
	var cubeInstance;
	if(spawnedCubes.size() >= MaxCubes):
		cubeInstance = spawnedCubes[0];
		spawnedCubes.remove_at(0);
	else:
		
		cubeInstance = cubePrefab.instantiate()
		get_tree().root.add_child(cubeInstance)
	
	spawnedCubes.append(cubeInstance);
	cubeInstance.position = position;
