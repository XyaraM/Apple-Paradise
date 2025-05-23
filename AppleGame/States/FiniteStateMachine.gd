class_name FiniteStateMachine
extends Node

@export var state: State
@export var current_state = state

func _ready():
	change_state(state)
	
func change_state(new_state: State):
	if state is State:
		state._exit_state()
	new_state._enter_state()
	state = new_state


func _on_dash_timer_timeout():
	if current_state == state:
		Variablemanager.SPEED = 900
		state._exit_state()
