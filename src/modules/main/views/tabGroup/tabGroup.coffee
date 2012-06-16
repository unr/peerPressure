define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./tabGroup.template"

  class tabGroup extends Backbone.View

    className: 'TabGroup'

    initialize: ->
      #($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

