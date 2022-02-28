FactoryBot.define do
    factory :organization do 
      email { "fake@fake.com" }
      name { "fakename" }
      phone { "1-555-666-2244" }
      status { :submitted }
      primary_name { "fake primary name" }
      secondary_name { "fake secondary name" }
      secondary_phone { "1-555-666-2244" }
      transportation { "yes" }
    end
end
