class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_status_id, :shopping_charges_id, 
      :prefecture_id, :days_id, :selling_price, :commit, :image).merge(user_id: current_user.id)
  end

end
