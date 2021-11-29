class ItemsController < ApplicationController
  before_action :get_item, only: %i[edit update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to confirm_items_path
    else
      render :edit
    end
  end

  def confirm
    @items = Item.all
  end

  private

  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :degree, :start_date, :finish_date, :price)
  end
end
