dialects = Dialect.create( [ { name: 'Yoda', icon_name: 'language' },
                             { name: 'Valley Girl', icon_name: 'local_bar' },
                             { name: 'Binary Code', icon_name: 'code' } ] )
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
