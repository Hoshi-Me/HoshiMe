class ThreeItemsController < ApplicationController
  def new
    @form = Form::ItemCollection.new
  end

  def create
    @form = Form::ItemCollection.new(item_collection_params)
    if @form.save
      redirect_to calculations_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def item_collection_params
    params.require(:form_item_collection).permit(items_attributes: %i[name degree start_date finish_date price])
  end
end
