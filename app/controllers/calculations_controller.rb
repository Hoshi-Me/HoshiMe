class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.all.order(sum: :desc)
  end
end
