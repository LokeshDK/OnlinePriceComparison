class ProductinfosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin, :only => [:new, :edit, :destroy]
  before_action :set_productinfo, only: [:show, :edit, :update, :destroy]

  # GET /productinfos
  # GET /productinfos.json
  def index
    @branchinfo = Branchinfo.find(params[:branchinfo_id])

    if !current_user.admin?
      @productList= @branchinfo.productinfos.where(user_id: current_user.id)
    else
      @productList = @branchinfo.productinfos
    end
    storeid = @branchinfo.storeinfo_id
    branchid = @branchinfo.id

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename=product.xlsx"
      }
      format.html { render :index, :branchinfo_id => branchid, :user_id => current_user.id }
    end
  end

  # GET /productinfos/1
  # GET /productinfos/1.json
  def show
  end

  # GET /productinfos/new
  def new
    @branchinfo = Branchinfo.find(params[:branchinfo_id])
    # Associate an branchinfo object with storeinfo 1
    @productinfo =Productinfo.new
  end

  # POST /productinfos
  # POST /productinfos.json
  def create
    @productinfo = Productinfo.new(productinfo_params)

    respond_to do |format|
      if @productinfo.save
        format.html { redirect_to @productinfo, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @productinfo }
      else
        format.html { render :new }
        format.json { render json: @productinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /branchinfos/1/edit
  def edit
  end

  # PATCH/PUT /productinfos/1
  # PATCH/PUT /productinfos/1.json
  def update
    respond_to do |format|
      if @productinfo.update(productinfo_params)
        format.html { redirect_to @productinfo, notice: 'Productinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @productinfo }
      else
        format.html { render :edit }
        format.json { render json: @productinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productinfos/1
  # DELETE /productinfos/1.json
  def destroy
    branchid = @productinfo.branchinfo_id

    @branchinfo = Branchinfo.find(branchid)

    storeid = @branchinfo.storeinfo_id
    @productinfo.destroy
    respond_to do |format|
      format.html { redirect_to :controller => "productinfos",
                                :action => "index", :branchinfo_id => branchid,
                                :storeinfo_id => storeid }
      format.json { head :no_content }
    end
  end

  def ensure_admin
    unless current_user || current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productinfo
      @productinfo = Productinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productinfo_params
      params.require(:productinfo).permit(
          :productname, :storeproductid, :productprice, :branchinfo_id, :image, :user_id)
    end
end
