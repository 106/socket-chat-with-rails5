describe 'ChatsController', type: :request do
  describe 'GET /chat' do
    before do
      cookies['user_id'] = '1'
      get chat_path
    end

    subject { response }

    it { is_expected.to render_template(:show) }
    its(:status) { is_expected.to be 200 }
  end
end
