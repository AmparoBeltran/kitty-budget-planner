class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :frequency, presence: true, numericality: { greater_than: 0 }

  scope :ordered, -> { order(id: :desc) }

  after_commit :update_summary, on: [ :create, :update, :destroy ]
  after_create_commit -> { broadcast_prepend_to "items", partial: "items/item", locals: { item: self }, target: "items" }

  def cost_per_day
    (price * frequency) / 30.0
  end

  def cost_per_week
    cost_per_day * 7
  end

  def cost_per_month
    price * frequency
  end

  def cost_per_year
    cost_per_month * 12
  end

  private

  def update_summary
    broadcast_replace_to "items", target: "budget_summary", partial: "summaries/show", locals: { items: Item.ordered }
  end
end
