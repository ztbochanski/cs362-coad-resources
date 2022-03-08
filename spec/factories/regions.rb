FactoryBot.define do
  factory :region do
    name { "fake region"}
    #sequence(:name) { |n| "fake region #{n}"}
  end
end
