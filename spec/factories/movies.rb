FactoryBot.define do
  factory :movie do
    title { Faker::Movie }
    plot { 'Horror' }
  end
end