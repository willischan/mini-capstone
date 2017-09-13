class ImagesController < ApplicationController  

  def new
    render "new.html.erb"
  end

  def create
    new_image = image.new(
      url: params[:url],
      product_id: params[:product_id]
      )
    new_image.save
    flash[:success] = "Product successfully created" 
    redirect_to "/products/#{new_product.id}"
  end


end
