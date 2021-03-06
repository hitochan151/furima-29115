class PurchaserDestniationController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @purchaser_destniation = PurchaserDestniation.new
    if current_user.id == @item.user_id || @item.purchaser.present?
      redirect_to  root_path
    end
  end

  def create
   @purchaser_destniation = PurchaserDestniation.new(purchaser_destniation_params)
    if @purchaser_destniation.valid?
      pay_item
      @purchaser_destniation.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchaser_destniation_params
    params.require(:purchaser_destniation).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: purchaser_destniation_params[:token],
        currency: 'jpy'
    )
  end
end