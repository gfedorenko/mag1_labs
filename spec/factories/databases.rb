FactoryBot.define do
  factory :database do
    name { Faker::HarryPotter.house }
  end
end
