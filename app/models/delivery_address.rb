class DeliveryAddress < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, :phone, :address, presence: true
  validates :phone, format: { with: VALID_PHONE_REGEX }
end
