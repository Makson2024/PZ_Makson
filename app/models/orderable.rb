class Orderable < ApplicationRecord
  belongs_to :logistic
  belongs_to :cart
  def total
    logistic.price * quantity
  end
end
