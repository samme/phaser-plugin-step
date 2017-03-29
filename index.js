// Generated by CoffeeScript 1.10.0
(function() {
  "use strict";
  var Phaser, StepPlugin,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Phaser = this.Phaser;

  Phaser.Plugin.Step = StepPlugin = (function(superClass) {
    extend(StepPlugin, superClass);

    function StepPlugin() {
      return StepPlugin.__super__.constructor.apply(this, arguments);
    }

    StepPlugin.prototype.keyChar = {
      STEP: "/",
      TOGGLE: "."
    };

    StepPlugin.prototype.keyCode = {
      STEP: Phaser.KeyCode.QUESTION_MARK,
      TOGGLE: Phaser.KeyCode.PERIOD
    };

    StepPlugin.prototype.init = function() {
      var keyboard;
      keyboard = this.game.input.keyboard;
      this.keyBindings = [];
      this.keyBindings.push(keyboard.addKey(this.keyCode.STEP).onUp.add(this.game.step, this.game));
      this.keyBindings.push(keyboard.addKey(this.keyCode.TOGGLE).onUp.add(this.toggleStep, this));
      this.position = new Phaser.Point(20, 20);
    };

    StepPlugin.prototype.render = function() {
      var debug, text;
      debug = this.game.debug;
      if (this.game.stepping) {
        text = "[" + this.keyChar.STEP + "] Step Forward  [" + this.keyChar.TOGGLE + "] Exit Step  Step Count: " + this.game.stepCount;
        debug.text(text, this.position.x, this.position.y, null, debug.font);
      }
    };

    StepPlugin.prototype.destroy = function() {
      StepPlugin.__super__.destroy.apply(this, arguments);
      this.removeKeyBindings();
    };

    StepPlugin.prototype.disableStep = function() {
      this.game.disableStep();
      this.game.debug.reset();
    };

    StepPlugin.prototype.enableStep = function() {
      this.game.enableStep();
      this.render();
    };

    StepPlugin.prototype.removeKeyBindings = function() {
      var binding, i, len, ref;
      ref = this.keyBindings;
      for (i = 0, len = ref.length; i < len; i++) {
        binding = ref[i];
        binding.detach();
      }
    };

    StepPlugin.prototype.toggleStep = function() {
      if (this.game.stepping) {
        this.disableStep();
      } else {
        this.enableStep();
      }
    };

    return StepPlugin;

  })(Phaser.Plugin);

}).call(this);
