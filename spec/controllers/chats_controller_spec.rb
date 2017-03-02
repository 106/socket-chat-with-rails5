describe ChatsController, type: :controller do
  describe 'GET show' do
    subject { response }

    context 'user logged in' do
      before do
        request.cookies['user_id'] = user.name
        get :show
      end

      let(:user) { create :user }
      let!(:message1) { create :message, user_id: user.id }
      let!(:message2) { create :message, user_id: user.id }

      it { is_expected.to render_template('show') }
      it { is_expected.to have_http_status(:success) }
      it 'assings all messages to @messages' do
        expect(assigns(:messages)).to eq [message1, message2]
      end
    end

    context 'user not logged in' do
      before do
        get :show
      end

      it { is_expected.to have_http_status(302) }
      it { is_expected.to redirect_to(sign_in_path) }
    end
  end
end
