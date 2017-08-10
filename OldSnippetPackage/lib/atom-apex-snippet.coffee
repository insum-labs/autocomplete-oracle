CoffeeView = require './atom-apex-snippet-view'
{CompositeDisposable} = require 'atom'
fs = require 'fs'

module.exports =
  CoffeeView: null
  modalPanel: null
  subscriptions: null
  config:
    commaPlacement:
      title: 'Comma Preference'
      description: 'Commas appear before/after parameters'
      type: 'string'
      default: 'Before'
      enum: ['Before','After']
      order: 10
    versionSupport:
      title: 'APEX version'
      type: 'string'
      default: '5.1'
      enum: ['4.2','5.0','5.1']
      order: 0
    capitalPref:
      title: 'Case Preference'
      description: 'Select whether snippet functions appear in upper or lower case'
      type:'string'
      default: 'Lower'
      enum: ['Upper','Lower']
      order: 15
    defaultPref:
      title: 'Default Preference'
      description: 'Seed parameters with defaults (when applicable)'
      type: 'string'
      default: 'Seed'
      enum: ['Seed','Empty']
      order: 20
    # omissionPref:
    #   title: 'Show/Omit Default Values'
    #   description: 'When default parameters are enabled, choose whether to show or omit the assumed default value'
    #   type: 'string'
    #   default: 'Show'
    #   enum:['Show','Omit']
    #   order: 25



  activate: (state) ->
    @CoffeeView = new CoffeeView(state.CoffeeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @CoffeeView.getElement(), visible: false)
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-apex-snippet:enableSnippets': => @enableSnippets()
    # @subscriptions.add atom.commands.add 'atom-workspace',
    #   'atom-apex-snippet:postComma': => @postComma()
    @subscriptions.add atom.commands.add 'atom-workspace',
      'CoffeeView:toggle': => @toggle()

  deactivate: ->
    @subscriptions.dispose()
    @modalPanel.destroy()
    @CoffeeView.destroy()

  serialize: ->
    # CoffeeViewState: @CoffeeView.serialize()

  toggle: ->
    console.log('View was toggled!')
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  enableSnippets: ->
    console.log('Convert text!')
    versionVar = atom.config.get('atom-apex-snippet.versionSupport')
    commaPref = atom.config.get('atom-apex-snippet.commaPlacement')
    setDefaults = atom.config.get('atom-apex-snippet.defaultPref')
    # omitVar = atom.config.get('atom-apex-snippet.omissionPref')
    omitVar = 'Show'
    casePref = atom.config.get('atom-apex-snippet.capitalPref')
    console.log(versionVar)
    console.log(commaPref)
    data = fs.readFileSync(process.env.ATOM_HOME+'\\packages\\atom-apex-snippet\\lib\\'+versionVar+'\\'+commaPref+''+setDefaults+''+omitVar+''+casePref+'.cson')
    fs.writeFileSync(process.env.ATOM_HOME + '\\packages\\atom-apex-snippet\\snippets\\snippets.cson', "")
    fs.writeFileSync(process.env.ATOM_HOME + '\\packages\\atom-apex-snippet\\snippets\\snippets.cson', data)
    console.log('wrote enableSnippets to snippets/snippets.cson')
    @toggle()


  # postComma: ->
  #   console.log('Convert text!')
  #   data = fs.readFileSync(process.env.ATOM_HOME+'\\packages\\atom-apex-snippet\\lib\\'+versionVar+'\\scrapedSnippetCommaEnds.cson')
  #   fs.writeFileSync(process.env.ATOM_HOME + '\\packages\\atom-apex-snippet\\snippets\\snippets.cson', "")
  #   fs.writeFileSync(process.env.ATOM_HOME + '\\packages\\atom-apex-snippet\\snippets\\snippets.cson', data)
  #   console.log('wrote postComma to snippets/snippets.cson')
  #   @toggle()
