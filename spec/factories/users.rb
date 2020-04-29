FactoryBot.define do
  factory :user do
    name {"葛飾北斎"}
    email {"test@mail.com"}
    profile {"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."}
    password {"12345678"}
    password_confirmation {"12345678"}
  end
end