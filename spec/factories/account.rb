# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    description { 'Savings account for college' }
    initial_deposit { 999 }
  end
end
