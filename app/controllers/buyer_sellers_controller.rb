class BuyerSellersController < ApplicationController
  before_action :set_buyer_seller, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  # GET /buyer_sellers
  # GET /buyer_sellers.json
  def index
    @buyer_sellers = BuyerSeller.all
  end

  # GET /buyer_sellers/1
  # GET /buyer_sellers/1.json
  def show
  end

  # GET /buyer_sellers/new
  def new
    @buyer_seller = BuyerSeller.new
  end

  # GET /buyer_sellers/1/edit
  def edit
  end

  # POST /buyer_sellers
  # POST /buyer_sellers.json
  def create
    # buyer_seller_params is not needed as the info is not coming from form
    @buyer_seller = BuyerSeller.new
    # link sellers id of that particular product to the join table
    @buyer_seller.seller_id = @product.seller_id
    # also update the buyer infomration in join table
    @buyer_seller.user_id = current_user.id

    respond_to do |format|
      if @buyer_seller.save
        # redirect to buyer page to pay and also pass product info to fetch the cost
        format.html { redirect_to buyer_page_path(:product_id => @product.id), notice: 'Buyer seller was successfully created.' }
        format.json { render :show, status: :created, location: @buyer_seller }
      else
        format.html { render :new }
        format.json { render json: @buyer_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyer_sellers/1
  # PATCH/PUT /buyer_sellers/1.json
  def update
    respond_to do |format|
      if @buyer_seller.update(buyer_seller_params)
        format.html { redirect_to @buyer_seller, notice: 'Buyer seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyer_seller }
      else
        format.html { render :edit }
        format.json { render json: @buyer_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyer_sellers/1
  # DELETE /buyer_sellers/1.json
  def destroy
    @buyer_seller.destroy
    respond_to do |format|
      format.html { redirect_to buyer_sellers_url, notice: 'Buyer seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer_seller
      @buyer_seller = BuyerSeller.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_seller_params
      params.require(:buyer_seller).permit(:user_id, :seller_id)
    end
end
