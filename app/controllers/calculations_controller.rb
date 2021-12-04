class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.all.includes(:item).order(sum: :desc)
  end
end
