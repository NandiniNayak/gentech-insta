class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_seller, only: [:new]

  # GET /products
  # GET /products.json
  def index
    # if index method is called from the search bar, filter out the products based on title of the product
    if params[:search]
      # to keep the controller skinny, define the logic involved in filtering out the product by title as method search in the model product
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    # since the buyer is linked to the product, it is mandatory to have an id set, setting it to default 0 doesnot work as there is no buyer(user) with an id 0. But buyer id can be updated only when a user wants to buy a product, under this situation. seller, who is a current user and wants to sell a product is also added as buyer by default
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_seller
      @seller = Seller.find(params[:seller_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :cost, :quantity, :user_id, :seller_id, :picture)
    end
end
