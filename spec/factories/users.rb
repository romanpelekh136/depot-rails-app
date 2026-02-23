FactoryBot.define do
  factory :user do
    name { "examplename" }
    email_address { "user@example.com" }
    password { "password" }
  end
end
