# frozen_string_literal: true

class TransferSerializer
  include FastJsonapi::ObjectSerializer
  attributes :source_account_id, :destination_account_id, :amount, :created_at
end
