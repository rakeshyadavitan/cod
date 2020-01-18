FactoryBot.define do
  factory :episode do
    title { Faker::TvShows::AquaTeenHungerForce }
    plot { 'Horror' }
    number {Faker::IDNumber}
  end
end