class Saving < ApplicationRecord
  belongs_to :potential_customer, class_name: 'User'
  belongs_to :potential_vendor, class_name: 'Profile'
end
