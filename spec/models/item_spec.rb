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

      it "imageが存在すれば登録できること" do
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
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーの情報が空では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
     
      it "商品の状態が空では登録できないこと" do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end
      
      it "配送料の負担が空では登録できないこと" do
        @item.shopping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping charges must be other than 1")
      end

      it "価格が空では登録できないこと" do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", "Selling price is invalid", "Selling price is not a number", "Selling price is not a number")
      end
      
      it "発送までの日数が空では登録できないこと" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      
      it "価格が300円未満では登録できないこと" do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
        
      it "価格が9999999円を越えたら登録できないこと" do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end

      it "発送元の地域が空では登録できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "販売価格は半角数字以外は保存できないこと" do
        @item.selling_price = "２００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number", "Selling price is not a number")
      end

      it "画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end