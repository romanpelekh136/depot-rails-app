FactoryBot.define do
  factory :product do
    title { "SOMETITLE" }
    description { "SOME DESCRIPTION" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_img.png'), 'image/png') }
    price {  "9.99" }
  end
end
