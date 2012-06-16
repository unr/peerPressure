define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  # Tabs = require 'cs!modules/main/views/tabs/tabs'
  TopBar = require 'cs!modules/main/views/topBar/topBar'
  BaseView = require 'cs!modules/main/views/baseview/baseview'

  #class definition
  class TabBarViewController extends Backbone.Router

    make: (args...)->
      Backbone.View::make args...

    initialize: (options)->
      @el = 'body'
      @$el = ($ @el)

    skeleton: (views...)->
      views.unshift new TopBar
      views

    routes:
      '': 'listview'
      'todos': 'listview'
      'notifications': 'notifications'
      'profile': 'profile'

    listview: ->
      @swap new BaseView text: 'baseview'

    notifications: ->
      @swap new BaseView text: 'notifications'

    profile: ->
      @swap new BaseView text: 'profile'

    swap: (views...) ->
      frag = document.createDocumentFragment()
      __view.leave?() for __view in @currentViews if @currentViews
      @currentViews = for view in @skeleton views...
        frag.appendChild view.render().el
        view
      @$el.empty().append frag
