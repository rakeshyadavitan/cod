FactoryBot.define do
  factory :movie do
    title { Faker::Book.title }
    plot { Faker::Book.genre }
  end
end