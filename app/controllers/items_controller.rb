class ItemsController < ApplicationController
  before_action :get_item, only: %i[edit update destroy]

  def index
    authorize(Item)
    @items = current_user.items
  end

  def new
    @item = current_user.items.build
  end

  def create
    authorize(Item)
    @item = current_user.items.build(item_params)
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

  private

  def get_item
    @item = Item.find(params[:id])
    authorize(@item)
  end

  def item_params
    params.require(:item).permit(:name, :degree, :start_date, :finish_date, :price)
  end
end
