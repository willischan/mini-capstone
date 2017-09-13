class Product < ApplicationRecord
  has_many :images
  belongs_to :supplier

  def friendly_created_at
    created_at.strftime("%A, %b %d")
  end

  def sale_message
    if price < 2
      "Discount Item!"
    else
      "Everyday Value!"
    end
  end 

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
