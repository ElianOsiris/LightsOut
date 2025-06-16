extends Node

func invert_number(number, min, max, clamp: bool) -> float:
	if clamp:
		number = clamp(number, min, max)
	return min + max - number

func find_node_in_children(enterlist, exitlist, node_type, single_layer: bool):
	for item in enterlist:
		var children = item.get_children()
		for child in children:
			if child.is_class(node_type):
				exitlist.append(child)
		if single_layer and item.is_class(node_type):
			exitlist.append(item)
