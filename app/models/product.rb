class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  has_many :images

  acts_as_paranoid
  mount_uploader :image, PictureUploader

  validates :name, :image, :price, :residual,  presence: true

  scope :product_residual, -> { where("residual > ?", 0) }
  scope :oldest, -> { order('created_at ASC') }
end
