fs    = require 'fs'
iconv = require 'iconv-lite'

module.exports =

  activate: (state) ->
    atom.commands.add 'atom-workspace', "utf8-to-sjis:utf-8", =>      @open 'utf-8'

  deactivate: ->

  serialize: ->

  open: (encoding) ->
    workspace = atom.workspace
    editor = workspace.getActiveTextEditor()
    path = editor.getPath()
    buffer = fs.readFileSync(path)
    convertedText = iconv.decode buffer, 'utf-8'
    editor.setText convertedText
