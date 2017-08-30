class ProductsController < ApplicationController
  def first_product_method
    @first_product = Product.first
    render "first_product.html.erb"
  end
end
