class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  

  def index
     @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render edit_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_status_id, :shopping_charge_id, 
      :prefecture_id, :day_id, :selling_price, :commit, :image).merge(user_id: current_user.id)
  end

end
