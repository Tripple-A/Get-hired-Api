# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :images
  
  validates :company_name, presence: true
  validates :location, presence: true
  validates :specialty, presence: true
  validates :pitch, presence: true
end
