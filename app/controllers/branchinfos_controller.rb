class BranchinfosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin, :only => [:new, :edit, :destroy]
  before_action :set_branchinfo, only: [:show, :edit, :update, :destroy]

  # GET /branchinfos
  # GET /branchinfos.json
  def index
    @storeinfo = Storeinfo.find(params[:storeinfo_id])

    @branchList = @storeinfo.branchinfos
  end

  # GET /branchinfos/1
  # GET /branchinfos/1.json
  def show
  end

  # GET /branchinfos/new
  def new
    @storeinfo = Storeinfo.find(params[:storeinfo_id])
    # Associate an branchinfo object with storeinfo 1
    @branchinfo = Branchinfo.new
  end

  # POST /branchinfos
  # POST /branchinfos.json
  def create
    @branchinfo = Branchinfo.new(branchinfo_params)

    respond_to do |format|
      if @branchinfo.save
        format.html { redirect_to @branchinfo, notice: 'Branchinfo was successfully created.' }
        format.json { render :index, status: :created, location: @branchinfo }
      else
        format.html { render :new }
        format.json { render json: @branchinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /branchinfos/1/edit
  def edit
  end

  # PATCH/PUT /branchinfos/1
  # PATCH/PUT /branchinfos/1.json
  def update
    respond_to do |format|
      if @branchinfo.update(branchinfo_params)
        format.html { redirect_to @branchinfo, notice: 'Branchinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @branchinfo }
      else
        format.html { render :edit }
        format.json { render json: @branchinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branchinfos/1
  # DELETE /branchinfos/1.json
  def destroy
    storeid = @branchinfo.storeinfo_id
    @branchinfo.destroy
    respond_to do |format|
      format.html { redirect_to :controller => "branchinfos", :action => "index", :storeinfo_id => storeid }
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
    def set_branchinfo
      @branchinfo = Branchinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branchinfo_params
      params.require(:branchinfo).permit(
          :branchname, :address, :phoneno, :branchincharge, :contactno, :storeinfo_id, :user_id)
    end
end
