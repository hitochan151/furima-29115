require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全データ全てが登録できる" do
        expect(@item).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it "商品名が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できないこと" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "カテゴリーの情報が空では登録できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
     
      it "商品の状態が空では登録できないこと" do
        @item.product_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      
      it "配送料の負担が空では登録できないこと" do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      
      it "発送までの日数が空では登録できないこと" do
        @item.days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
      
      it "価格が空では登録できないこと" do
        @item.shopping_charges_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
        
      it "発送元の地域が空では登録できないこと" do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
    end
  end
end    