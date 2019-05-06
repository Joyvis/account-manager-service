# frozen_string_literal: true

FactoryBot.define do
  factory :transfer do
    source_account_id { create(:account).id }
    destination_account_id { create(:account).id }
    amount { 25.99 }
  end
end
