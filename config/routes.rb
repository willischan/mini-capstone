Rails.application.routes.draw do
  get "/first_product" => "products#first_product_method"
  get "/all_products" => "products#all_products_method"
end
