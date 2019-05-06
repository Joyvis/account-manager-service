# frozen_string_literal: true

class TransfersController < ApplicationController
  def create
    transfer = Transfer.new(transfer_params)
    if transfer.save
      render_success transfer
    else
      render_error transfer
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:source_account_id,
                                     :destination_account_id, :amount)
  end
end
