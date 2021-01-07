require 'rails_helper'

RSpec.describe PurchaserDestniation, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchaser_destniation = FactoryBot.build(:purchaser_destniation, user_id: user.id, item_id: item.id)
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
         @purchaser_destniation.errors.full_messages
        expect(@purchaser_destniation).to be_valid
       end
      it 'building_nameは空でも保存できること' do
        @purchaser_destniation.building_name = ' '
        expect(@purchaser_destniation).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'post_codeが空だと保存できないこと' do
       @purchaser_destniation.post_code = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchaser_destniation.post_code = '1234567'
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchaser_destniation.prefecture_id = 1
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityを選択していないと保存できないこと' do
        @purchaser_destniation.city = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("City can't be blank", "City is invalid")
      end
      it 'cityが半角数字だと保存できないこと' do
        @purchaser_destniation.city = '1234'
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("City is invalid")
      end
      it 'addressを選択していないと保存できないこと' do
        @purchaser_destniation.address = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberを選択していないと保存できないこと' do
        @purchaser_destniation.phone_number = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含まない半角英数混合の11文字以内でないと保存できないこと' do
        @purchaser_destniation.post_code = '１２３ー４５６７ー１２３４５'
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Post code is invalid")
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@purchaser_destniation).to be_valid
      end
      it "user_idが空では登録できないこと" do
        @purchaser_destniation.user_id = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @purchaser_destniation.item_id = nil
        @purchaser_destniation.valid?
        expect(@purchaser_destniation.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
