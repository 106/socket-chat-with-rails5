module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = { name: Faker::Name.name, id: Time.now.to_i }
    end
  end
end
