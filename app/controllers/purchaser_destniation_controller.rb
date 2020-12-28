class PurchaserDestniationController < ApplicationController

  def index
    @purchaser_destniation = PurchaserDestniation.new(params[:item_id])
  end

  def create
   @purchaser_destniation = PurchaserDestniation.new(purchaser_destniation_params)
    if @purchaser_destniation.valid?
      @purchaser_destniation.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchaser_destniation_params
    params.require(:purchaser_destniation).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser_id)
    .merge(item_id: params[:item_id])
  end
end
