class ItemsController < ApplicationController
  before_action :get_item, only: %i[edit update destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.calculation
      redirect_to calculations_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      @item.calculation
      redirect_to items_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, success: t('.success')
  end

  def confirm
    @items = Item.all.order(created_at: :asc)
  end

  private

  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :degree, :start_date, :finish_date, :price)
  end
end
