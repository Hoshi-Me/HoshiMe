class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.all.includes(:item).order(sum: :desc)
    calculations = @calculations.first(3)
    calculations_name = []
    calculations.each do |calculation|
      calculations_name << calculation.item.name
    end
    gon.calculations_name = calculations_name
    gon.calculations = calculations
  end

  def show
    @calculation = Calculation.find(params[:id])
    gon.calculation_name = @calculation.item.name
    gon.calculation = @calculation
  end
end
