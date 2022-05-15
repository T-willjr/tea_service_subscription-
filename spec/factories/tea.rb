FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { ["212 degrees", "175 degrees", "180 degrees"].sample }
    brew_time { ["3 minutes", "4 minutes", "5 minutes"].sample }
  end
end