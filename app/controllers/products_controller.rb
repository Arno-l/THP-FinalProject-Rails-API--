class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.all.joins(:image_attachment)
    render json: @products.map { |product| 
      product.as_json().merge(
      image_path: url_for(product.image) )}  
  end

  # GET /products/1
  def show
    if @product.image.attached? 
      render json: @product.as_json().merge(
        image_path: url_for(@product.image))
   else 
     render json: @product.as_json
  end 
   end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :country, :description, :stock, :intensity, :image)
    end
end
