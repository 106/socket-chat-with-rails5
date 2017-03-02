class MessageBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(data)
    message = Message.create body: data['message']
    ActionCable.server.broadcast 'chat_channel', action: 'send_message', message: message
  end
end
