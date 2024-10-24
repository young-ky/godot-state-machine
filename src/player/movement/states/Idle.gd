class_name Idle extends State

@export var runState: State
@export var jumpState: State
@export var fallState: State
@export var dashState: State

func enter() -> void:
  super()
  parent.velocity.x = 0

func handleInput(_event: InputEvent) -> State:
  if (getJump() && parent.is_on_floor()):
    return jumpState

  if (getMovementInput() != 0.0):
    return runState

  if (Input.is_action_just_pressed('dash')):
    return dashState

  return null

func handlePhysics(delta: float) -> State:
  parent.velocity.y += gravity * delta
  parent.move_and_slide()

  if (!parent.is_on_floor()):
    return fallState

  return null