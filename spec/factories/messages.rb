FactoryGirl.define do
  factory :message do
    body Faker::Friends.quote
    user
  end
end
