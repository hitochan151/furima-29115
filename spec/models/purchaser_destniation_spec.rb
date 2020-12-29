require 'rails_helper'

RSpec.describe PurchaserDestniation, type: :model do
  describe '配送先情報の保存' do
    before do
      @purchaser_destniation = FactoryBot.build(:purchaser_destniation)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'post_codeが空だと保存できないこと' do
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'prefecture_idを選択していないと保存できないこと' do
    end
    it 'cityを選択していないと保存できないこと' do
    end
    it 'addressを選択していないと保存できないこと' do
    end
    it 'building_nameは空でも保存できること' do
    end
    it 'phone_numberを選択していないと保存できないこと' do
    end
    it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
    end
  end
end
