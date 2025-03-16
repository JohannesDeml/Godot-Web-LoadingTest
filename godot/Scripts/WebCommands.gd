extends Node

# Dictionary to store all registered commands
# Format: { "command_name": { "method": method_ref, "category": str, "description": str, "params": [] } }
var _commands = {}
# Sorted structure for categories and commands
# Format: { category: [sorted_command_names] }
var _sorted_commands = {}

var _my_js_callback
var externalator

func _ready():
	if OS.has_feature("web"):
		_my_js_callback = JavaScriptBridge.create_callback(commandCallback)
		externalator = JavaScriptBridge.get_interface("externalator")
		externalator.addGodotFunction('runCommand', _my_js_callback)

		# Register built-in commands
		register_command("help", "System", help, "Shows all available commands")
		# Add more built-in commands here

		print("Godot WebCommands ready -> Run 'runCommand(\"help\")' in browser console to see usage")

func register_command(commandName: String, category: String, method: Callable, description: String, params: Array = []):
	commandName = commandName.to_lower()

	# Store command in main dictionary
	_commands[commandName] = {
		"method": method,
		"category": category,
		"description": description,
		"params": params
	}

	# Update sorted structure
	if not _sorted_commands.has(category):
		# Insert new category in sorted position
		var categories = _sorted_commands.keys()
		var insert_pos = 0
		for existing_category in categories:
			if category < existing_category:
				break
			insert_pos += 1
		_sorted_commands[category] = []

	# Insert command name in sorted position
	var commands = _sorted_commands[category]
	var insert_pos = 0
	for existing_command in commands:
		if commandName < existing_command:
			break
		insert_pos += 1
	commands.insert(insert_pos, commandName)

func commandCallback(args):
	# Handle both string and array inputs
	var command_name: String
	var command_args = []

	if args is String:
		command_name = args
	elif args is Array and args.size() > 0:
		command_name = args[0]
		command_args = args.slice(1)
	else:
		push_error("Invalid command format")
		return

	# change command name to be always lower case
	command_name = command_name.to_lower()

	if not _commands.has(command_name):
		push_error("Command not found: " + command_name)
		return

	var command = _commands[command_name]
	command.method.callv(command_args)

func help():
	var help_text = ""

	# Display commands using pre-sorted structure
	for category in _sorted_commands:
		help_text += "[b]%s[/b]\n" % category

		for command_name in _sorted_commands[category]:
			var command = _commands[command_name]
			var params_str = ""
			for param in command.params:
				params_str += ", " + str(param)

			help_text += "  runCommand(\"%s\"%s) -> %s\n" % [
				command_name,
				params_str,
				command.description
			]

	# Strip all newlines and spaces before and after the text
	help_text = help_text.strip_edges()

	print(help_text)
