# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'showing a account' do
    before { get :show, params: { id: account_id } }

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
end
