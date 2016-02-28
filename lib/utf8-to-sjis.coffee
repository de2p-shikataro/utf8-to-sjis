fs    = require 'fs'
iconv = require 'jconv'

module.exports =

  activate: (state) ->
    atom.commands.add 'atom-workspace', "utf8-to-sjis", =>      @open 'UTF8'

  deactivate: ->

  serialize: ->

  open: (encoding) ->
    workspace = atom.workspace
    editor = workspace.getActiveTextEditor()
    path = editor.getPath()
    buffer = fs.readFileSync(path)
    decodetedStr = iconv.decode buffer, encoding
    editor.setText decodetedStr

  save: (encoding) ->
      workspace = atom.workspace
      editor = workspace.getActiveTextEditor()
      path = editor.getPath()
      buffer = fs.readFileSync(path)
      str = buffer.toString 'shift_jis'
      encodedBuf = iconv.encode str, encoding
      fs.writeFileSync( uri, encodedBuf )
