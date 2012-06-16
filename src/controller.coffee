define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  Tabs = require 'cs!modules/main/views/tabs/tabs'

  #class definition
  class Controller extends Backbone.Router

    initialize: ->
      @body = $('<div id="body"/>')
      @body.addClass('container')
      ($ 'body').append @body

    routes:
      '': 'attach'

    attach: ->
      # Just a simple demonstration of some modules cooperating.
      view = new Tabs
      @body.append view.render().el
