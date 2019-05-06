# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransfersController, type: :controller do
  describe 'creating a transfer' do
    before do
      request.headers['Authorization'] = RequestStore.store[:token]
      post :create, params: { transfer: transfer_params }
    end

    context 'with valid params' do
      let(:transfer_params) { attributes_for(:transfer) }

      it 'transfer created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:transfer_params) { { amount: 12 } }

      it 'transfer not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
