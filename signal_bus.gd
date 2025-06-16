extends Node

# Dictionary of event_name -> list of listeners (Callables)
var listeners := {}

func emit(event_name: String) -> void:
	if listeners.has(event_name):
		# Duplicate the list so we can safely remove dead listeners while iterating
		for cb in listeners[event_name].duplicate():
			if cb.is_valid():
				cb.call()
			else:
				listeners[event_name].erase(cb)

func connect_event(event_name: String, target: Object, method_name: String) -> void:
	if not listeners.has(event_name):
		listeners[event_name] = []

	var cb = Callable(target, method_name)
	if not listeners[event_name].has(cb):
		listeners[event_name].append(cb)

func disconnect_event(event_name: String, target: Object, method_name: String) -> void:
	if listeners.has(event_name):
		var cb = Callable(target, method_name)
		listeners[event_name].erase(cb)
