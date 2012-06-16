define (require, exports, module) ->

  eventEmitter ?= {}

  Backbone = require 'backbone'
  _ = require 'underscore'

  if eventEmitter.length > 0 
    eventEmitter
  else
    _.extend eventEmitter, Backbone.Events
