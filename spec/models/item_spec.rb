require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_status_idが空では出品できない' do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it 'product_status_idが1では出品できない' do
        @item.product_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it 'shipping_charges_idが空では出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_charges_idが1では出品できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは半角数字でないと出品できない' do
        @item.price = '000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceは半角英数字混合では出品できない' do
        @item.price = 'abc000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceは半角英字では出品できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが300より少ないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999より多いと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
