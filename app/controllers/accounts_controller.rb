# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    account = Account.find_by(id: params[:id])
    account.calcule_balance unless account.blank?
    render_success account
  end
end
