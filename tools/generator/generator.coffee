_ = require 'underscore'   
fs = require 'fs'
path = require 'path'
mkdirp = require 'mkdirp'

FFI = require('node-ffi')

#run command
libc = new FFI.Library null,
  "system": ["int32", ["string"]]
run = libc.system

_.str = require 'underscore.string'
_.mixin _.str.exports()
_.str.include 'Underscore.string', 'string'

class Generator

  loadTemplate: (file)->
    fs.readFileSync file, 'utf8'

  generateTemplate: (@options)->
    [command, base, type, klass] = @options['_']
    inheritsModule =  _(@options['inherits']).capitalize()

    opts = 
      klass: _(klass).capitalize()
      inheritsModule: inheritsModule or= 'Backbone.View'
      baseDir: base
      type: type + 's'

    switch type
      when 'view'
        @writeTemplate('.coffee', @compileTemplate type, 'base.template', opts)
        @writeTemplate('.scss', @compileTemplate type, 'base.scss.template', opts)
      when 'controller'
        console.log @compileTemplate type, 'base.template', opts
        'no template yet.'
      when 'model'
        'no template yet.'
      else
        console.error "ERROR: invalid type: #{type}"
        

  compileTemplate: (type, templateName, opts)->
    file = path.resolve(__dirname + '/../templates/')
    template = @loadTemplate file + '/' + templateName
    _.template template, opts
  
  writeTemplate: (extension, data)->
    if not @options then throw 'have to generate template first before writing'
    [command, base, type, klass] = @options['_']
    file = path.resolve(__dirname + '/../../lib/modules')
    file = file + "/#{base}/#{type}s/#{klass.toLowerCase()}/#{klass.toLowerCase()}"
    file = file + extension

    path.exists file, (exists)=>
      if exists
        console.error "ERROR File: #{file} already exists."
      else if @options['dryrun'] is true
        console.log data
      else
        mkdirp path.dirname(file), 0755, (err)->
          if err
            console.error err
          else 
            fs.writeFileSync(file, data, encoding='utf8')

exports.Generator = new Generator
