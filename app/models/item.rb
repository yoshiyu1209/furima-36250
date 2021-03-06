class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
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

    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id,
                :product_status_id,
                :shipping_charges_id,
                :shipping_area_id,
                :days_to_ship_id
    end

    with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                 message: 'を設定範囲内にしてください' } do
      validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    end
  end
end
