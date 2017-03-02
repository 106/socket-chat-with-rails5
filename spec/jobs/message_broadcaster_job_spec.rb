describe MessageBroadcasterJob do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  let(:data) { { 'message' => 'valid test message' } }
  let(:invalid_data) { { 'message' => '' } }
  let(:user) { create :user }

  describe '#perform' do
    before do
      described_class.perform_later(data, user.id)
    end

    subject { described_class }

    it { is_expected.to have_been_enqueued }
    it { is_expected.to have_been_enqueued.on_queue('default') }

    it 'creates message' do
      expect { described_class.perform_now(data, user.id) }.to change { user.messages.count }.from(0).to(1)
    end

    it 'does not create message' do
      expect { described_class.perform_now(invalid_data, user.id) }.not_to change { user.messages.count }.from(0)
    end
  end
end
