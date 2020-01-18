FactoryBot.define do
  factory :season do
    title { Faker::TvShows::AquaTeenHungerForce }
    plot { 'Horror' }
    number {Faker::IDNumber}
  end
end