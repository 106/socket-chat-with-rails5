FactoryGirl.define do
  factory :dialect do
    name Faker::Book.title
    icon_name Faker::File.file_name('./', 'icon', 'png')
  end
end
