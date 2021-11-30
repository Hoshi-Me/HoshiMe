class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    # @item = Item.new
    @form = Form::ItemCollection.new
  end

  def create
    # @item = Item.new(item_params)
    @form = Form::ItemCollection.new(item_collection_params)
    # if @item.save
    if @form.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :degree, :start_date, :finish_date, :price)
  end

  def item_collection_params
    params.require(:form_item_collection).permit(items_attributes: %i[name degree start_date finish_date price])
  end
end
