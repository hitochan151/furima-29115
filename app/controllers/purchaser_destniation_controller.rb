class PurchaserDestniationController < ApplicationController

  def index
    @purchaser_destniation = PurchaserDestniation.new
  end

  def create
    binding.pry
    @purchaser_destniation = PurchaserDestniation.new(purchaser_params)
    if @purchaser_destniation.valid?
      @purchaser_destniation.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_destniation)
    .permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number)
    .merge(:item_id, :user_id, purchaser.id)
  end
end
