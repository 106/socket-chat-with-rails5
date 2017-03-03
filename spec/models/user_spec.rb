RSpec.describe User, type: :model do
  subject { build :user }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:messages) }
  it { is_expected.to belong_to(:dialect) }
end
