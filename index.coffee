"use strict"

{Phaser} = this

class Phaser.Plugin.Step extends Phaser.Plugin

  keyChar:
    STEP: "/"
    TOGGLE: "."

  keyCode:
    STEP:   Phaser.KeyCode.QUESTION_MARK # slash
    TOGGLE: Phaser.KeyCode.PERIOD

  init: ->
    {keyboard} = @game.input
    @keyBindings = []
    @keyBindings.push keyboard.addKey(@keyCode.STEP)  .onUp.add @game.step, @game
    @keyBindings.push keyboard.addKey(@keyCode.TOGGLE).onUp.add @toggleStep, this
    @position = new Phaser.Point 20, 20
    return

  render: ->
    {debug} = @game
    if @game.stepping
      text = "[#{@keyChar.STEP}] Step Forward  [#{@keyChar.TOGGLE}] Exit Step  Step Count: #{@game.stepCount}"
      debug.text text, @position.x, @position.y, null, debug.font
    return

  destroy: ->
    super
    @removeKeyBindings()
    return

  disableStep: ->
    @game.disableStep()
    @game.debug.reset()
    return

  enableStep: ->
    @game.enableStep()
    @render()
    return

  removeKeyBindings: ->
    for binding in @keyBindings
      binding.detach()
    return

  toggleStep: ->
    if @game.stepping then @disableStep() else @enableStep()
    return
