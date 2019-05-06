# frozen_string_literal: true

class Account < ApplicationRecord
  attr_reader :balance

  has_many :credited_transfers, class_name: 'Transfer',
                                foreign_key: :destination_account_id
  has_many :debited_transfers, class_name: 'Transfer',
                               foreign_key: :source_account_id
  def calculate_balance
    credited_values = credited_transfers.sum(:amount)
    debited_values = debited_transfers.sum(:amount)
    @balance = (initial_deposit + credited_values) - debited_values
  end
end
