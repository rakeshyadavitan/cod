require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = FactoryBot.build(:user) }

  subject { @user }

  it { should validate_presence_of(:email) }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  it { should validate_uniqueness_of(:email) }

  it { should have_many(:purchases).dependent(:destroy) }

end
