RSpec.describe Dialect, type: :model do
  subject { build :dialect }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:icon_name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:icon_name) }
end
