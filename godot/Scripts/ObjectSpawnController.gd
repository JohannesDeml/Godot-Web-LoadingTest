extends Node3D

@export var spawner_scene: PackedScene
@export var spawner_count: int = 5
@export var spawner_radius: float = 0.5
@export var spawner_cooldown: float = 0.5

var spawners: Array[Node3D] = []

func _ready():
	# Create initial spawners
	for i in spawner_count:
		_add_spawner()
	_update_spawners()

func _add_spawner():
	var spawner = spawner_scene.instantiate()
	add_child(spawner)
	spawners.append(spawner)
	_update_spawners()

func remove_spawner():
	if spawners.is_empty():
		return

	var spawner = spawners.pop_back()
	spawner.queue_free()
	_update_spawners()

func pause_spawning():
	for spawner in spawners:
		spawner.set_process(false)

func resume_spawning():
	for spawner in spawners:
		spawner.set_process(true)

func _update_spawners():
	var count = spawners.size()
	if count == 0:
		return

	var angle_step = 2 * PI / count
	var cooldown_step = spawner_cooldown / count

	for i in count:
		var spawner = spawners[i]
		var angle = i * angle_step
		var spawnerPosition = Vector3(
			cos(angle) * spawner_radius,
			0.0,
			sin(angle) * spawner_radius
		)
		spawner.position = spawnerPosition
		spawner.SpawnCooldown = spawner_cooldown
		# Set initial spawn delay offset for each spawner
		spawner.timeToNextSpawn = cooldown_step * i