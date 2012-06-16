define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./topBar.template"

  class TopBar extends Backbone.View

    className: 'TopBar'

    initialize: ->
      ($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

