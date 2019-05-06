# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def valid_until_now?
    errors.details.size.zero?
  end
end
