App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  send_message: (message, author_id) ->
    @perform 'send_message', message: message

  typing: (author_id) ->
    @perform 'typing', author_id: author_id

  stop_typing: ->
    @perform 'stop_typing'

  received: (action) ->
    switch action['action']
      when 'typing'
        $('#someone_typing').text action['user_name'] + ' is typing'
        $('#someone_typing').show()
      when 'stop_typing'
        $('#someone_typing').hide()
      when 'send_message'
        $('#someone_typing').hide()
        $('ul').append '<li>' + action['message']['body'] + '</li>'
      else
        console.log action
        console.log data
