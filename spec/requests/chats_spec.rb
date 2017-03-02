describe 'ChatsController', type: :request do
  describe 'GET /chat' do
    before do
      get chat_path
    end

    subject { response }

    it { is_expected.to render_template(:show) }
    its(:status) { is_expected.to be 200 }
  end
end
