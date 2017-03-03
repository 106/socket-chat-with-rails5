RSpec.describe Message, type: :model do
  before do
    allow(Translator::Degraeve).to receive(:new).and_return(translator)
    allow(translator).to receive(:translate!).and_return('Translated message')
  end
  subject { build :message, user: user }
  let(:dialect) { create :dialect }
  let(:user) { create :user, dialect: dialect }
  let(:translator) { instance_double(Translator::Degraeve) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_length_of(:body).is_at_most(140) }
  it { is_expected.to belong_to(:user) }
end
