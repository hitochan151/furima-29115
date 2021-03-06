class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

 
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
    @message = Message.new
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if  current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_status_id, :shopping_charge_id, 
      :prefecture_id, :day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

end
