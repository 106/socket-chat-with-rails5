describe SessionsController, type: :controller do
  subject { response }

  describe 'GET new' do
    before do
      get :new
    end

    it { is_expected.to render_template('new') }
    it { is_expected.to have_http_status(:success) }
    it 'assings new User to @user' do
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe 'POST create' do
    subject do
      post(:create, params: { user: { name: 'Tarantino' } })
      response
    end
    it 'set cookies' do
      post(:create, params: { user: { name: 'Tarantino' } })
      expect(response.cookies['user_id']).to eq 'Tarantino'
    end
    it 'creates user' do
      expect { post(:create, params: { user: { name: 'Tarantino' } }) }.to change { User.count }.from(0).to(1)
    end
    it { is_expected.to have_http_status(302) }
    it { is_expected.to redirect_to(chat_path) }
  end

  describe 'GET destroy' do
    before do
      get :destroy
    end

    it 'reset cookies' do
      get :destroy
      expect(response.cookies['user_id']).to be_nil
    end

    it { is_expected.to have_http_status(302) }
    it { is_expected.to redirect_to(sign_in_path) }
  end
end
