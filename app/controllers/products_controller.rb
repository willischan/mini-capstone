class ProductsController < ApplicationController
  def first_product_method
    @first_product = Product.first
    render "first_product.html.erb"
  end

  def all_products_method
    @all_products = Product.all
    render "all_products.html.erb"
  end

end
