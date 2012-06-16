define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  template = require "tpl!./profileView.template"

  class ProfileView extends Backbone.View

    className: 'ProfileView'

    initialize: ->
      #($ @el).addClass 'row'

    render: ->
      ($ @el).html template()
      this

