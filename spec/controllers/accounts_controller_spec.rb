# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'showing a account', :auth_token do
    before do
      request.headers['Authorization'] = RequestStore.store[:token]
      get :show, params: { id: account_id }
    end

    subject { JSON.parse(response.body, symbolize_names: true)[:data] }

    context 'with valid id' do
      let(:account_id) { create(:account).id }

      it 'account displayed' do
        is_expected.not_to be_blank
      end
    end

    context 'with a invalid id' do
      let(:account_id) { 0 }

      it 'account not displayed' do
        is_expected.to be_blank
      end
    end
  end

  describe 'request' do
    context 'without a token' do
      before { get :show, params: { id: 1 } }

      it do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
