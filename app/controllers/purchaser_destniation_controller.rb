class PurchaserDestniationController < ApplicationController

  def index
    @purchaser_destniation = Purchaserdestniation.new
  end

  def create
    @purchaser_destniation = Purchaserdestniation.new(purchaser_params)
    if @purchaser_destniation.valid?
      @purchaser_destniation.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchaser_params
    params.require(:order).permit(:price)
  end
end
