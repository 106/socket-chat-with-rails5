describe 'dummy_action' do
  subject { 2+2 }
  it {is_expected.to eq 4}
  its(:class) { is_expected.to eq Fixnum }
end
