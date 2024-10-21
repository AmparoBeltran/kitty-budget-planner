class SummariesController < ApplicationController
  def show
    @items = Item.ordered
    @total_per_day = @items.sum(&:cost_per_day)
    @total_per_week = @items.sum(&:cost_per_week)
    @total_per_month = @items.sum(&:cost_per_month)
    @total_per_year = @items.sum(&:cost_per_year)
  end
end
