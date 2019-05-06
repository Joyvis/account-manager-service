require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'authenticating a user' do
    before { post :authenticate, params: login_params }

    let(:user) { create(:user) }

    context 'with valid params' do
      let(:login_params) do
        { email: user.email, password: user.password }
      end

      it { expect(response).to have_http_status(:ok) }
    end

    context 'with invalid params' do
      let(:login_params) do
        { email: 'mail', password: 'senha' }
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
