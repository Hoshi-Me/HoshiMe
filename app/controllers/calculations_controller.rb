class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.all.includes(:item).order(sum: :desc)
  end

  def show
    @calculation = Calculation.find(params[:id])
    gon.calculation_name = @calculation.item.name
    gon.calculation = @calculation
  end
end
