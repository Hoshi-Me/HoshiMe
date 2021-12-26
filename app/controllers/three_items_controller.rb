class ThreeItemsController < ApplicationController
  #skip_before_action :require_login, only: %i[new create]

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
    params.require(:form_item_collection).permit(items_attributes: %i[name degree start_date finish_date price]).merge(user_id: current_user.id)
    #params[:form_item_collection][:items_attributes]["0"].merge(user_id: current_user.id)
    #params[:form_item_collection][:items_attributes]["1"].merge(user_id: current_user.id)
    #params[:form_item_collection][:items_attributes]["2"].merge(user_id: current_user.id)
  end
end
