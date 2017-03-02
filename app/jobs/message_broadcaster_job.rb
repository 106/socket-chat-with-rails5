class MessageBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(data, user_id)
    user = User.find(user_id)
    message = user.messages.create(body: data['message'])
    ActionCable.server.broadcast('chat_channel', action: 'send_message', message: message) if message.persisted?
  end
end
