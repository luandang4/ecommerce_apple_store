class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, dependent: :destroy

  scope :latest, -> { order('cart_items.created_at DESC') }
end
