require 'rails_helper'

RSpec.describe PurchaserDestniation, type: :model do
  describe '配送先情報の保存' do
    before do
      @purchaser_destniation = FactoryBot.build(:purchaser_destniation)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
       @purchaser_destniation.errors.full_messages
      expect(@purchaser_destniation).to be_valid
    end
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
      expect(@purchaser_destniation.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
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
      expect(@purchaser_destniation.errors.full_messages).to include("Address can't be blank", "Address is invalid")
    end
    it 'addressが半角数字だと保存できないこと' do
      @purchaser_destniation.address = '1234'
      @purchaser_destniation.valid?
      expect(@purchaser_destniation.errors.full_messages).to include("Address is invalid")
    end
    it 'building_nameは空でも保存できること' do
      @purchaser_destniation.building_name = nil
      expect(@purchaser_destniation).to be_valid
    end
    it 'phone_numberを選択していないと保存できないこと' do
      @purchaser_destniation.phone_number = nil
      @purchaser_destniation.valid?
      expect(@purchaser_destniation.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberがハイフンを含まない半角でないと保存できないこと' do
      @purchaser_destniation.post_code = '１２３ー４５６７'
      @purchaser_destniation.valid?
      expect(@purchaser_destniation.errors.full_messages).to include("Post code is invalid")
    end
    it "priceとtokenがあれば保存ができること" do
      expect(@purchaser_destniation).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @purchaser_destniation.token = nil
      @purchaser_destniation.valid?
      expect(@purchaser_destniation.errors.full_messages).to include("Token can't be blank")
    end
  end
end
