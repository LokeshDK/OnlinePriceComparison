class ProductinfosController < ApplicationController
  before_action :set_productinfo, only: [:show, :edit, :update, :destroy]

  # GET /productinfos
  # GET /productinfos.json
  def index
    @currentBranch = Branchinfo.find(params[:branchinfo_id])
  
    @productList = @currentBranch.productinfos
  end

  # GET /productinfos/1
  # GET /productinfos/1.json
  def show
    @currentBranch = Branchinfo.find(params[:branchinfo_id])

    # For URL like /storeinfo/1/branchinfos/2
    # Find an branchinfo in storeinfo 1 that has id=2
    @currentProduct = @currentBranch.productinfos.find(params[:id])
  end

  # GET /productinfos/new
  def new
    @currentBranch = Branchinfo.find(params[:branchinfo_id])
    # Associate an branchinfo object with storeinfo 1
    @currentProduct = @currentBranch.productinfos.build
  end

  # POST /productinfos
  # POST /productinfos.json
  def create
    @currentBranch = Branchinfo.find(params[:branchinfo_id])

    # For URL like /storeinfos/1/branchinfoss
    # Populate an review associate with storeinfo 1 with form data
    # stores will be associated with the branches
    @currentProduct = @currentBranch.productinfos.build(params.require(:productinfo).permit(
        :productname, :storeproductid, :productprice, :image))

    if @currentBranch.save
      # Save the branch successfully
      redirect_to storeinfo_branchinfo_productinfo_url(@currentBranch, @currentProduct)
    else
      render :action => "new"
    end
  end

  # GET /branchinfos/1/edit
  def edit
    @currentBranch = Branchinfo.find(params[:branchinfo_id])

    # For URL like /storeinfo/1/branchinfo/2/edit
    # Get branchinfo id=2 for storeinfo 1
    @currentProduct = @currentBranch.productinfos.find(params[:id])
  end

  # PATCH/PUT /productinfos/1
  # PATCH/PUT /productinfos/1.json
  def update
    @currentBranch = Branchinfo.find(params[:branchinfo_id])

    @currentProduct = productinfos.find(params[:id])
    if @currentProduct.update_attributes(params.require(:productinfo).permit(
        :productname, :storeproductid, :productprice, :image))
      # Save the branchinfo successfully
      redirect_to storeinfo_branchinfo_productinfo_url(@currentBranch, @currentProduct)
    else
      render :action => "edit"
    end
  end

  # DELETE /productinfos/1
  # DELETE /productinfos/1.json
  def destroy
    @currentBranch = Branchinfo.find(params[:branchinfo_id])

    @currentProduct = Productinfo.find(params[:id])
    @currentProduct.destroy

    respond_to do |format|
      format.html { redirect_to storeinfo_branchinfo_productinfos_path(@currentBranch) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productinfo
      @productinfo = Productinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productinfo_params
      params.require(:productinfo).permit(:productname, :storeproductid, :productprice, :branchinfo_id, :image, :categorie_id)
    end
end
