FactoryBot.define do
  factory :user do
    name {"FAKE USER"}
    email {'fake@user.com'}
    password { "password" }
    password_confirmation {"password"}
    phone_number {"8314152002"}

  end
end