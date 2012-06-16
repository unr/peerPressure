define (require, exports, module) ->

  #requires
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'

  class BaseView extends Backbone.View

    className: 'BaseView'

    initialize: ->
      if @options.text then @text = @options.text

    render: ->
      ($ @el).html @text
      this

