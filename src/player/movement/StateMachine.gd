class_name StateMachine extends Node

@export var initialState: State

var currentState: State

func init(parent: CharacterBody2D, sprite2D, moveComponent) -> void:
  for child in get_children():
    child.parent = parent
    child.sprite2D = sprite2D
    child.moveComponent = moveComponent

  changeState(initialState)

func changeState(newState: State) -> void:
  if currentState:
    currentState.exit()

  currentState = newState
  currentState.enter()

func handleInput(event: InputEvent) -> void:
  var newState = currentState.handleInput(event)

  if newState:
    changeState(newState)

func handlePhysics(delta: float) -> void:
  var newState = currentState.handlePhysics(delta)

  if newState:
    changeState(newState)

func update(delta: float) -> void:
  var newState = currentState.update(delta)

  if newState:
    changeState(newState)
