FactoryBot.define do
    factory :organization do 
      email { "fake@fake.com" }
      name { "fakename" }
      phone { "fakephone" }
      status { :approved }
      primary_name { "fake primary name" }
      secondary_name { "fake secondary name" }
      secondary_phone { "fake secondary phone" }
    end
end
