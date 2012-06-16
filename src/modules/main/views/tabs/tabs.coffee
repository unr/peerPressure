define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./tabs.template"

  class Tabs extends Backbone.View

    className: 'Tabs'

    initialize: ->
      ($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

