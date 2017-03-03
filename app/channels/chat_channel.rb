class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
    ActionCable.server.broadcast 'chat_channel', action: 'users_online', data: online_users
  end

  def unsubscribed
    ActionCable.server.broadcast 'chat_channel', action: 'users_online', data: online_users
  end

  def send_message(data)
    MessageBroadcasterJob.perform_now(data, connection.current_user.id)
  end

  def typing
    ActionCable.server.broadcast 'chat_channel', action: 'typing', user_name: connection.current_user.name
  end

  def stop_typing
    ActionCable.server.broadcast 'chat_channel', action: 'stop_typing'
  end

  private

  def connections_list
    ActionCable.server.connections
  end

  def online_users
    ApplicationController.renderer.render(partial: 'chats/users',
                                          locals: { users: connections_list.map(&:current_user) })
  end
end
