class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :title,
              :text,
              :image

    with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :category_id,
                :product_status_id,
                :shipping_charges_id,
                :shipping_area_id,
                :days_to_ship_id
    end

    with_options format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999, message: 'is out of setting range' }
    end
  end



end
