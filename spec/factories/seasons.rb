FactoryBot.define do
  factory :season do
    title { Faker::Book.title }
    plot { Faker::Book.genre }
    number {Faker::Number.non_zero_digit}
  end
end