FactoryBot.define do
  factory :user do
    name { Faker::Fantasy::Tolkien.character }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    api_key { SecureRandom.hex }
  end
end
