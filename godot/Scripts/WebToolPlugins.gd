extends Node

# Make this a singleton by adding it to Project Settings -> Autoload
# with the name "WebToolPlugins", using a class_name does not work for WebGL

func _ready():
	# Allow browser shortcuts like F12, Ctrl+R, etc.
	if OS.get_name() == "Web":
		JavaScriptBridge.eval("""
			function isBrowserShortcut(e) {
				return (
					e.key === 'F12' || // Open DevTools
					(e.ctrlKey && e.shiftKey && e.key === 'I') ||  // Open DevTools
					(e.metaKey && e.shiftKey && e.key === 'I') ||  // Open DevTools (macOS)
					e.key === 'F5' ||  // Refresh
					(e.ctrlKey && e.key === 'r') ||  // Refresh
					(e.metaKey && e.key === 'r') ||  // Refresh (macOS)
					(e.ctrlKey && e.key === 'w') ||  // Close tab
					(e.metaKey && e.key === 'w') ||  // Close tab (macOS)
					(e.ctrlKey && e.key === 't') ||  // New tab
					(e.metaKey && e.key === 't') ||  // New tab (macOS)
					(e.ctrlKey && e.key === 'Tab') ||  // Switch tabs
					(e.metaKey && e.key === 'Tab') ||  // Switch tabs (macOS)
					(e.ctrlKey && e.shiftKey && e.key === 'Tab') ||  // Switch tabs (reverse)
					(e.metaKey && e.shiftKey && e.key === 'Tab') ||  // Switch tabs (reverse, macOS)
					(e.altKey && e.key === 'Home') ||  // Home page
					(e.ctrlKey && e.key === 'l') ||  // Focus address bar
					(e.metaKey && e.key === 'l') ||  // Focus address bar (macOS)
					(e.altKey && e.key === 'Left') ||  // Back
					(e.metaKey && e.key === '[') ||  // Back (macOS)
					(e.altKey && e.key === 'Right') ||  // Forward
					(e.metaKey && e.key === ']')    // Forward (macOS)
				);
			}

			document.addEventListener('keydown', function(e) {
				if (isBrowserShortcut(e)) {
					e.stopPropagation();
					return true;  // Allow the default browser behavior
				}
			}, true);
		""")

func show_info_panel() -> void:
	if OS.get_name() != "Web":
		print("WebToolPlugins.show_info_panel() called")
		return
	JavaScriptBridge.eval("WebToolPlugins._SetInfoPanelVisible(true);")

func hide_info_panel() -> void:
	if OS.get_name() != "Web":
		print("WebToolPlugins.hide_info_panel() called")
		return
	JavaScriptBridge.eval("WebToolPlugins._SetInfoPanelVisible(false);")

func set_variable(variable_name: String, variable_value: String) -> void:
	if OS.get_name() != "Web":
		print("WebToolPlugins.set_variable() called - name: '%s', value: '%s'" % [variable_name, variable_value])
		return
	JavaScriptBridge.eval("WebToolPlugins._SetStringVariable('%s', '%s');" % [variable_name, variable_value])

func add_time_tracking_event(event_name: String) -> void:
	if OS.get_name() != "Web":
		print("WebToolPlugins.add_time_tracking_event() called - event: '%s'" % event_name)
		return
	JavaScriptBridge.eval("WebToolPlugins._AddTimeTrackingEvent('%s');" % event_name)

func add_fps_tracking_event(fps: float) -> void:
	if OS.get_name() != "Web":
		# Don't log anything here, since it would spam the console
		return
	JavaScriptBridge.eval("WebToolPlugins._AddFpsTrackingEvent(%f);" % fps)