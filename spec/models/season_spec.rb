require 'rails_helper'

RSpec.describe Season, type: :model do

  it { should have_many(:episodes).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
  it { should validate_presence_of(:number) }
  
end
