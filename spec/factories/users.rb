FactoryBot.define do
  factory :user do
    
    email {'fake@user.com'}
    password{ "password"}
    role { "organization" }
    organization
    factory :admin do
      role {"admin"}
    end
  end

end