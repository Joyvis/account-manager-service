# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validating' do
    context 'relationships' do
      it { is_expected.to have_many(:credited_transfers) }
      it { is_expected.to have_many(:debited_transfers) }
    end
  end

  describe 'getting balance of account' do
    context 'calculating' do
      let(:accounts) { create_list(:account, 2) }

      before do
        [create(:transfer, source_account_id: accounts.first.id,
                           destination_account_id: accounts.last.id,
                           amount: 200),
         create(:transfer, source_account_id: accounts.last.id,
                           destination_account_id: accounts.first.id,
                           amount: 50)]
      end

      subject { accounts.last.calculate_balance }

      it 'balance calculated' do
        is_expected.to eq(accounts.last.initial_deposit + 150)
      end
    end
  end
end
