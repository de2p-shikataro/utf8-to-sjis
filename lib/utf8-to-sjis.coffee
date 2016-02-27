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
    convertedText = iconv.decode buffer, encoding
    editor.setText convertedText
    # atom.workspace.saveActivePaneItem()

  save: (encoding) ->
    workspace = atom.workspace
    editor = workspace.getActiveTextEditor()
    path = editor.getPath()
    buffer = fs.readFileSync(path)
    data = buffer.toString 'shift_jis'
    buf = iconv.encode data, encoding
    fs.writeFileSync( uri, buf )
