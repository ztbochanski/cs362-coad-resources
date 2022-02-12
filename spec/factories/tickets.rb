FactoryBot.define do
  factory :ticket do 
    closed { false }
    phone { "1-555-666-2244" }
    name { "fake ticket" }
    organization { nil }
    region
    resource_category
  end
end
