extends Node

func _ready():
	var web_commands = get_node("/root/WebCommands")

	# Register commands to be usable from the console

	web_commands.register_command(
		"set_time_scale",
		set_time_scale,
		"Sets the game time scale",
		["scale: float"]
	)

	web_commands.register_command(
		"log_memory",
		log_memory,
		"Logs current memory usage"
	)

	web_commands.register_command(
		"print_example",
		log_example_message,
		"Logs an example rich text message to the console (BBCode)"
	)

	web_commands.register_command(
		"print_rich",
		log_rich_message,
		"Logs a rich text message to the console (BBCode)",
		["message: String"]
	)

	web_commands.register_command(
		"toggle_pause",
		toggle_pause,
		"Toggles the game pause state"
	)

	web_commands.register_command(
		"pause_game",
		pause_game,
		"Pauses the game"
	)

	web_commands.register_command(
		"unpause_game",
		unpause_game,
		"Unpauses the game"
	)

	web_commands.register_command(
		"quit",
		quit_game,
		"Quits the application"
	)

func set_time_scale(scale: float):
	Engine.time_scale = scale
	print("Time scale set to: ", scale)

func log_memory():
	var stats = Performance.get_monitor(Performance.MEMORY_STATIC)
	print("Static Memory: %d MB" % (stats / (1024 * 1024)))

func log_rich_message(message: String):
	print_rich(message)

func log_example_message():
	print("This is an [b]example of a [i]rich text[/i] message [bgcolor=black][color=white](print())[/color][/bgcolor][/b]. [color=red]It supports[/color] [b]BBCode[/b] [url=https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#class-globalscope-method-print-rich]like this[/url].")
	print_rich("This is an [b]example of a [i]rich text[/i] message (print_rich())[/b]. [color=red]It supports[/color] [b]BBCode[/b] [url=https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#class-globalscope-method-print-rich]like this[/url].")
	push_warning("This is a warning message (push_warning())")
	push_error("This is an error message (push_error())")

func toggle_pause():
	get_tree().paused = !get_tree().paused
	print("Game pause state: ", "Paused" if get_tree().paused else "Unpaused")

func pause_game():
	get_tree().paused = true
	print("Game paused")

func unpause_game():
	get_tree().paused = false
	print("Game unpaused")

func quit_game():
	print("Quitting application...")
	get_tree().quit()
