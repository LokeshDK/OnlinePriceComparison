class BranchinfosController < ApplicationController
  before_action :set_branchinfo, only: [:show, :edit, :update, :destroy]

  # GET /branchinfos
  # GET /branchinfos.json
  def index
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    @branchList = @currentStore.branchinfos
  end

  # GET /branchinfos/1
  # GET /branchinfos/1.json
  def show
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    # For URL like /storeinfo/1/branchinfos/2
    # Find an branchinfo in storeinfo 1 that has id=2
    @currentBranch = @currentStore.branchinfos.find(params[:id])
  end

  # GET /branchinfos/new
  def new
    @currentStore = Storeinfo.find(params[:storeinfo_id])
    # Associate an branchinfo object with storeinfo 1
    @currentBranch = @currentStore.branchinfos.build
  end

  # POST /branchinfos
  # POST /branchinfos.json
  def create
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    # For URL like /storeinfos/1/branchinfoss
    # Populate an review associate with storeinfo 1 with form data
    # stores will be associated with the branches
    @currentBranch = @currentStore.branchinfos.build(params.require(:branchinfo).permit(:branchname, :address, :phoneno, :branchincharge, :contactno))

    if @currentBranch.save
      # Save the branch successfully
      redirect_to storeinfo_branchinfo_url(@currentStore, @currentBranch)
    else
      render :action => "new"
    end
  end

  # GET /branchinfos/1/edit
  def edit
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    # For URL like /storeinfo/1/branchinfo/2/edit
    # Get branchinfo id=2 for storeinfo 1
    @currentBranch = @currentStore.branchinfos.find(params[:id])
  end

  # PATCH/PUT /branchinfos/1
  # PATCH/PUT /branchinfos/1.json
  def update
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    @currentBranch = branchinfos.find(params[:id])
    if @currentBranch.update_attributes(params.require(:branchinfo).permit(:branchname, :address, :phoneno, :branchincharge, :contactno))
      # Save the branchinfo successfully
      redirect_to storeinfo_branchinfo_url(@currentStore, @currentBranch)
    else
      render :action => "edit"
    end
  end

  # DELETE /branchinfos/1
  # DELETE /branchinfos/1.json
  def destroy
    @currentStore = Storeinfo.find(params[:storeinfo_id])

    @currentBranch = Branchinfo.find(params[:id])
    @currentBranch.destroy

    respond_to do |format|
      format.html { redirect_to storeinfo_branchinfos_path(@currentStore) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branchinfo
      @branchinfo = Branchinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branchinfo_params
      params.require(:branchinfo).permit(:branchname, :address, :phoneno, :branchincharge, :contactno, :storeinfo_id)
    end
end
