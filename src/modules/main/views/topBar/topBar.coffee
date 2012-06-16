define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./topBar.template"

  class TopBar extends Backbone.View

    className: 'TopBar'

    events:
      'click #add': 'add'

    initialize: ->
      ($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

    add: ->
      $('#myModal').reveal()
