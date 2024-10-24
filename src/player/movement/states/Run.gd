class_name Run extends State

@export var idleState: State
@export var jumpState: State
@export var fallState: State
@export var dashState: State

func handleInput(_event: InputEvent) -> State:
  if Input.is_action_just_pressed('dash'):
    return dashState

  return null

func handlePhysics(delta: float) -> State:
  if (getJump() && parent.is_on_floor()):
    return jumpState

  parent.velocity.y += gravity * delta

  var movement = getMovementInput() * moveSpeed

  if (movement == 0):
    return idleState

  sprite2D.flip_h = movement < 0
  parent.velocity.x = movement
  parent.move_and_slide()

  if (!parent.is_on_floor()):
    return fallState

  return null
