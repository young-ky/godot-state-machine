class_name StateDebug extends Label

@export var stateMachine: StateMachine

func _process(_delta):
  text = 'State: ' + stateMachine.currentState.name
