user1 = Faker::Friends.character
user1.messages.create( [ { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote } ] )

user2 = Faker::Friends.character
user2.messages.create( [ { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote } ] )
