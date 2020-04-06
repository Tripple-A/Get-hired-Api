# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_one_attached :image
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence: true
  has_many :savings, foreign_key: :potential_customer_id
  has_many :potential_vendors, through: :savings, source: :potential_vendor
end
