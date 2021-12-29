class CalculationsController < ApplicationController
  def index
    @calculations = []
    current_user.items.each { |item| @calculations << item.calculation }
    calculations = @calculations.first(3)
    calculations_name = []
    calculations.each { |calculation| calculations_name << calculation.item.name }
    gon.calculations_name = calculations_name
    gon.calculations = calculations
  end

  def show
    @calculation = Calculation.find(params[:id])
    @rank = params[:rank]
    gon.calculation_name = @calculation.item.name
    gon.calculation = @calculation
  end
end
