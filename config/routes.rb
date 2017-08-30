Rails.application.routes.draw do
  get "/first_product" => "products#first_product_method"
end
