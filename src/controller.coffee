define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  #Tabs = require 'cs!modules/main/views/tabs/tabs'
  TopBar = require 'cs!modules/main/views/topBar/topBar'
  TabGroup = require 'cs!modules/main/views/tabGroup/tabGroup'

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
      topBar = new TopBar
      tabGroup = new TabGroup
      @body.append topBar.render().el
      @body.append "<div style='height: 391px;'>hello</div>"
      @body.append tabGroup.render().el
