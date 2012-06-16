define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  #Tabs = require 'cs!modules/main/views/tabs/tabs'
  TopBar = require 'cs!modules/main/views/topBar/topBar'

  #class definition
  class Controller extends Backbone.Router

    initialize: ->
      @body = $('<div id="body"/>')
      #@body.addClass('container')
      # paul nuked this - ruined header bar. Body shouldn't be container. :/
      ($ 'body').append @body

    routes:
      '': 'attach'

    attach: ->
      # Just a simple demonstration of some modules cooperating.
      #tabs = new Tabs
      view = new TopBar
      @body.append view.render().el
