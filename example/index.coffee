"use strict"

{Phaser} = this

leftEmitter = undefined
rightEmitter = undefined

@GAME = new Phaser.Game
  scaleMode: Phaser.ScaleManager.SHOW_ALL
  state:
    init: ->
      @game.plugins.add Phaser.Plugin.Step
      @game.debug.font = '16px monospace'
      @game.debug.lineHeight = 20
      return

    preload: ->
      @load.baseURL = 'http://examples.phaser.io/assets/'
      @load.crossOrigin = 'anonymous'
      @load.image 'sky', 'skies/cavern2.png'
      @load.spritesheet 'balls', 'sprites/balls.png', 17, 17
      return

    create: ->
      @add.image 0, 0, 'sky'

      leftEmitter = @add.emitter(50, @world.centerY - 200)
      leftEmitter.bounce.setTo 0.5, 0.5
      leftEmitter.setXSpeed 100, 200
      leftEmitter.setYSpeed -50, 50
      leftEmitter.makeParticles 'balls', 0, 250, true, true

      rightEmitter = @add.emitter(@world.width - 50, @world.centerY - 200)
      rightEmitter.bounce.setTo 0.5, 0.5
      rightEmitter.setXSpeed -100, -200
      rightEmitter.setYSpeed -50, 50
      rightEmitter.makeParticles 'balls', 1, 250, true, true

      leftEmitter.start false, 5000, 20
      rightEmitter.start false, 5000, 20

      @add.text 20, 560, '[.] Toggle Step',
        fill: 'white'
        font: @game.debug.font
      return

    update: ->
      @physics.arcade.collide leftEmitter, rightEmitter, @change, null, this
      return

    change: (a, b) ->
      a.frame = 3
      b.frame = 3
      return
