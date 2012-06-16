define (require, exports, module) ->
  Backbone = require 'backbone'

  #local requires
  TabGroup = require 'cs!modules/main/views/tabGroup/tabGroup'
  TopBar = require 'cs!modules/main/views/topBar/topBar'
  BaseView = require 'cs!modules/main/views/baseview/baseview'
  TaskView = require 'cs!modules/main/views/taskView/taskView'

  #class definition
  class TabBarViewController extends Backbone.Router

    make: (args...)->
      Backbone.View::make args...

    initialize: (options)->
      @el = 'body'
      @$el = ($ @el)
      @tabGroup = new TabGroup
      @topBar = new TopBar

    skeleton: (views...)->
      views.unshift @topBar
      views.push @tabGroup
      views

    routes:
      '': 'listview'
      'todos': 'listview'
      'notifications': 'notifications'
      'profile': 'profile'

    listview: ->
      @swap new TaskView

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
