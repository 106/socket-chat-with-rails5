App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  send_message: (message) ->
    @perform 'send_message', message: message

  typing: ->
    @perform 'typing'

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
        $('#messages_container').append(action['message'])
        $('#messages_container').scrollTop($('#messages_container')[0].scrollHeight);
      when 'users_online'
        $('#users_online').html(action['data'])
      else
        console.log action
        console.log data
