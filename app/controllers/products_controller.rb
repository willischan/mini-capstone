class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort_by] == "price_high"
      @products = Product.all.order(price: :desc)
    elsif params[:sort_by] == "price_low"
      @products = Product.all.order(price: :asc)
    elsif params[:filter_by] == "less_than_two"
      @products = Product.all.where("price < ?",2)
    ###Alternative Method For Random Product, it's not in show###  
    elsif params[:random] == "random"  
      @products = Product.order("RANDOM()").limit(1)
    elsif params[:name]
      @products = Product.where("name ILIKE ?", "%#{params[:name]}%")
    end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier: 2
      )
    new_product.save
    flash[:success] = "Product successfully created" 
    redirect_to "/products/#{new_product.id}"

  end

  def show
    # if params[:id] == "random"
    #   @product = Product.all.sample
    # else
      @product = Product.find(params[:id])
    # end
    render "show.html.erb"
  end

  def edit
    @product = Product.find(params[:id])
    render "edit.html.erb"
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      in_stock: params[:in_stock],
      supplier: 2
      )
    flash[:warning] = "Product successfully updated"
    redirect_to "/products/#{product.id}"
end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Product successfully destroyed"
    redirect_to "/products"
  end

end
