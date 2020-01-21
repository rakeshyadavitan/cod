FactoryBot.define do
  factory :purchase do
    user
    # purchaseable
    price {Faker::Number.non_zero_digit}
    video_quality {'HD'}
  end
end