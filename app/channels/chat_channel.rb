class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    MessageBroadcasterJob.perform_now data
  end

  def typing(_user_name)
    ActionCable.server.broadcast 'chat_channel', action: 'typing', user_name: 'pavel'
  end

  def stop_typing
    ActionCable.server.broadcast 'chat_channel', action: 'stop_typing'
  end
end
