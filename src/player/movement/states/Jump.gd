class_name Jump extends State

@export var idleState: State
@export var runState: State
@export var fallState: State

@export var jumpForce = 500.0

func enter() -> void:
  super()
  parent.velocity.y = -jumpForce

func handlePhysics(delta: float) -> State:
  parent.velocity.y += gravity * delta

  if (parent.velocity.y > 0):
    return fallState

  var movement = getMovementInput() * moveSpeed

  if (movement != 0):
    sprite2D.flip_h = (movement < 0)
  parent.velocity.x = movement
  parent.move_and_slide()

  if (parent.is_on_floor()):
    if (movement != 0):
      return runState
    return idleState

  return null
