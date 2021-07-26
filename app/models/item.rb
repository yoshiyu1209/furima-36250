class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship
  

end
