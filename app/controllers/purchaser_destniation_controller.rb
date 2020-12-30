class PurchaserDestniationController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchaser_destniation = PurchaserDestniation.new
  end

  def create
   binding.pry
   @purchaser_destniation = PurchaserDestniation.new(purchaser_destniation_params)
    if @purchaser_destniation.valid?
      @purchaser_destniation.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def purchaser_destniation_params
    params.require(:purchaser_destniation).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
