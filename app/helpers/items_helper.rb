module ItemsHelper
  def calculate_cost(item, period)
    monthly_cost = item.price * item.frequency
    daily_cost = monthly_cost / 30.0

    case period
    when :daily
      daily_cost
    when :weekly
      daily_cost * 7
    when :monthly
      monthly_cost
    when :yearly
      monthly_cost * 12
    end
  end
end