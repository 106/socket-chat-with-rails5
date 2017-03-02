$(document).on 'keydown', '#message_input', (e) ->
  if e.keyCode is 13
    App.chat.send_message e.target.value, $('#author_id').val()
    e.target.value = ''
    e.preventDefault()
    e.stopPropagation()
  else
    App.chat.typing $('#author_id').val()

$(document).on 'blur', '#message_input', (e) ->
  App.chat.stop_typing()
