define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./taskView.template"

  class TaskView extends Backbone.View

    className: 'TaskView'

    initialize: ->
     # ($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

