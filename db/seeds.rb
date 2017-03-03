dialects = Dialect.create( [ { name: 'Yoda', icon_name: 'yoda' },
                             { name: 'Valley Girl', icon_name: 'valley' },
                             { name: 'Binary Code', icon_name: 'binary' } ] )
user1 = User.create( name: Faker::Friends.character, dialect: dialects.sample )
user1.messages.create( [ { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote } ] )

user2 = User.create( name: Faker::Friends.character, dialect: dialects.sample )
user2.messages.create( [ { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote },
                         { body: Faker::Friends.quote } ] )
