FactoryBot.define do
  factory :post do
    title {"凱風快晴"}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
  end
end