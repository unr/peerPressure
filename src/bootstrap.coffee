define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  domReady = require 'domReady'
  App = require 'cs!controller'

  ##Bootstrap the app here.
  domReady ->
    new App
    Backbone.history.start()

  #export
  module.exports = {}
