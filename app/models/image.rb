# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :profile
  validates :title, presence: true
  validates :url, presence: true
end
