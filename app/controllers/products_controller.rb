class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(f_product:  '1').paginate(:page => params[:page], :per_page => 6)
  end

  # GET /products/1
  # GET /products/1.json
  def show

  end

  # GET /products/new
  def new
    @product = Product.new
     # Getting category list
    @categories = Category.sel_options()
    @product_category = ProductCategory.new

  end

  # GET /products/1/edit
  def edit
    @categories = Category.sel_options()
    @product_category = ProductCategory.new
    @cat_select = ProductCategory.find(:product_id)
    render json: @cat_select
    return
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    @category_id = product_catid_params[:category_id]
    

    
    respond_to do |format|
      if @product.save
          @category_id.each do |v|

          pc = ProductCategory.new({:category_id => v,:product_id => @product.id})

          pc.save 
        end
        format.html { redirect_to @product, notice: 'Product was successfully added.' }
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
        @category_id = product_catid_params[:category_id]
        ProductCategory.destroy_all(:product_id => @product.id)
        @category_id.each do |v|

          pc = ProductCategory.new({:category_id => v,:product_id => @product.id})

          pc.save 
        end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:description, :image, :name, :f_product)
    end    

    def product_catid_params
      params.require(:product).require(:product_category).permit(:category_id => [])
    end


end
