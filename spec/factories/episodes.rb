FactoryBot.define do
  factory :episode do
    title { Faker::Book.title }
    plot { Faker::Book.genre }
    number {Faker::Number.non_zero_digit}
    season
  end
end