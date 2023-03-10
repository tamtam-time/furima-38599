class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top, only: [:edit, :update, :destroy]

  def index
   @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :category_id, :status_id, :postage_id, :area_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    if @item.user_id == current_user.id && @item.history.nil?
    else
      redirect_to root_path
    end
  end


end
