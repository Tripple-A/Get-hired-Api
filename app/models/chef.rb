# frozen_string_literal: true

class Chef < ApplicationRecord
  validates :company_name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :specialty, presence: true
end
