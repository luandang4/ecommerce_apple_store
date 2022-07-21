class Order < ApplicationRecord
  extend Enumerize

  has_many :order_items
  belongs_to :user
  belongs_to :delivery_address

  enumerize :payment_method, in: { cash: 0, card: 1 }
  enumerize :status, in: { pending: 0, active: 1, success: 2, reject: 3 }
end
