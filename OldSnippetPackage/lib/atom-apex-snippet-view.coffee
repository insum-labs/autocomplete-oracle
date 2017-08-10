module.exports =
class CoffeeView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('CoffeeView')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Apex snippet changes applied. Reload the application window to apply the changes. (ctrl-shift-f5)"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
