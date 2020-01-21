require 'rails_helper'

RSpec.describe Purchase, type: :model do

  let(:purchase) { FactoryBot.build :purchase }
  subject { purchase }

  it { should respond_to(:price) }
  it { should respond_to(:user) }
  it { should respond_to(:video_quality) }
  it { should respond_to(:purchaseable) }

  it { should validate_presence_of :user}
  it { should validate_presence_of :price}
  it { should validate_presence_of :video_quality}
  it { should validate_presence_of :purchaseable}
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should belong_to :user }

  it { should have_db_column(:purchaseable_id).of_type(:integer) }
  it { should have_db_column(:purchaseable_type).of_type(:string) }

  it { should belong_to(:purchaseable) }

end
