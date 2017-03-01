RSpec.describe Message, type: :model do
  subject { build :message }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_most(140) }
end
