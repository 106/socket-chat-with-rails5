class MessageBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(data, user_id)
    user = User.find(user_id)
    mes = user.messages.create(body: data['message'])
    ActionCable.server.broadcast('chat_channel', action: 'send_message', message: render_m(mes)) if mes.persisted?
  end

  private

  def render_m(message)
    ApplicationController.renderer.render(partial: 'chats/message', locals: { message: message })
  end
end
