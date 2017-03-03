FactoryGirl.define do
  factory :user do
    name Faker::Friends.character
    dialect
  end
end
