# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  describe 'validating' do
    context 'presence validations' do
      it { is_expected.to validate_presence_of(:source_account_id) }
      it { is_expected.to validate_presence_of(:destination_account_id) }
      it { is_expected.to validate_presence_of(:amount) }
      it do
        is_expected.to validate_numericality_of(:amount)
          .is_greater_than_or_equal_to(1)
      end
    end

    context 'relationships' do
      it { is_expected.to belong_to(:source_account) }
      it { is_expected.to belong_to(:destination_account) }
    end

    context 'difference between account ids' do
      let(:account) { create(:account) }
      let(:transfer) do
        build(:transfer, source_account_id: account.id,
                         destination_account_id: account.id,
                         amount: 1)
      end

      subject { transfer.valid? }

      it 'transfer not created' do
        is_expected.to be_falsey
      end
    end

    context 'insufficient funds' do
      let(:source_account) { create(:account, initial_deposit: 2) }

      let(:transfer) do
        build(:transfer, source_account_id: source_account.id,
                         destination_account_id: create(:account).id,
                         amount: 999)
      end

      subject { transfer.valid? }

      it { is_expected.to be_falsey }
    end
  end
end
