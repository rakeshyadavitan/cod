shared_examples "purchaseable" do
  it { is_expected.to have_many(:purchases) }
end