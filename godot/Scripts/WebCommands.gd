extends Node

var _my_js_callback
var externalator

func commandCallback(args):
	# Convert args to string, handling both string and array inputs
	var args_str = str(args)
	print("command with args: " + args_str)

func _ready():
	if OS.has_feature("web"):
		_my_js_callback = JavaScriptBridge.create_callback(commandCallback)
		externalator = JavaScriptBridge.get_interface("externalator")
		externalator.addGodotFunction('runCommand',_my_js_callback)
