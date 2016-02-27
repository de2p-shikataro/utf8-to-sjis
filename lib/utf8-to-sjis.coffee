Utf8ToSjisView = require './utf8-to-sjis-view'
{CompositeDisposable} = require 'atom'

module.exports = Utf8ToSjis =
  utf8ToSjisView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @utf8ToSjisView = new Utf8ToSjisView(state.utf8ToSjisViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @utf8ToSjisView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'utf8-to-sjis:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @utf8ToSjisView.destroy()

  serialize: ->
    utf8ToSjisViewState: @utf8ToSjisView.serialize()

  toggle: ->
    console.log 'Utf8ToSjis was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
