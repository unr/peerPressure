define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  TaskView = require 'cs!../taskview/taskview'

  template = require "tpl!./taskView.template"

  class TaskList extends Backbone.View

    className: 'TaskView'

    initialize: ->
     # ($ @el).addClass 'row'

    render: ->
      frag = document.createDocumentFragment()
      @views = for model in @collection.models
        view = new TaskView
          model: model
        frag.append view.render().el
        view
      @$el.html frag
      this

    addOne: ->

