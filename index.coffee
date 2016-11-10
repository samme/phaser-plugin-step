"use strict"

{Phaser} = this

Phaser.Plugin.Step = class StepPlugin extends Phaser.Plugin

  keyChar:
    STEP: "/"
    TOGGLE: "."

  keyCode:
    STEP:   Phaser.KeyCode.QUESTION_MARK # slash
    TOGGLE: Phaser.KeyCode.PERIOD

  init: ->
    {keyboard} = @game.input
    keyboard.addKey(@keyCode.STEP)  .onUp.add @game.step, @game
    keyboard.addKey(@keyCode.TOGGLE).onUp.add @toggleStep, this
    @position = new Phaser.Point 20, 20
    return

  render: ->
    {debug} = @game
    if @game.stepping
      text = if @game.pendingStep
        "Step Count: #{@game.stepCount} [#{@keyChar.TOGGLE}] Exit Step"
      else
        "[#{@keyChar.STEP}] Step Forward  [#{@keyChar.TOGGLE}] Exit Step"
      debug.text text, @position.x, @position.y, debug.color, debug.font
    return

  toggleStep: ->
    if @game.stepping then @game.disableStep() else @game.enableStep()
    @render()
    return
