extends Node

func _ready():
	var web_commands = get_node("/root/WebCommands")

	# Register commands to be usable from the console

	web_commands.register_command(
		"set_time_scale",
		set_time_scale,
		"Sets the game time scale",
		["scale"]
	)

	web_commands.register_command(
		"log_memory",
		log_memory,
		"Logs current memory usage"
	)

	web_commands.register_command(
		"log_message",
		log_message,
		"Logs a message to the console",
		["message"])

func set_time_scale(scale: float):
	Engine.time_scale = scale
	print("Time scale set to: ", scale)

func log_memory():
	var stats = Performance.get_monitor(Performance.MEMORY_STATIC)
	print("Static Memory: %d MB" % (stats / (1024 * 1024)))

func log_message(message: String):
	print(message)