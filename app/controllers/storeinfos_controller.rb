class StoreinfosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin, :only => [:new, :edit, :destroy]
  before_action :set_storeinfo, only: [:show, :edit, :update, :destroy]

  # GET /storeinfos
  # GET /storeinfos.json
  def index
    @storeinfos = Storeinfo.order(:id)
  end

  # GET /storeinfos/1
  # GET /storeinfos/1.json
  def show
  end

  # GET /storeinfos/new
  def new
    @storeinfo = Storeinfo.new
  end

  # GET /storeinfos/1/edit
  def edit
  end

  # POST /storeinfos
  # POST /storeinfos.json
  def create
    @storeinfo = Storeinfo.new(storeinfo_params)

    respond_to do |format|
      if @storeinfo.save
        select_query = "SELECT MAX(id) FROM storeinfos"
        newStore = ActiveRecord::Base.connection.execute(select_query)

        insert_query = "INSERT INTO branchinfos (branchname, address, phoneno, branchincharge, contactno, storeinfo_id, user_id, created_at, updated_at) VALUES ('#{params.as_json["storeinfo"]["storename"]}', '#{params.as_json["storeinfo"]["address"]}', #{params.as_json["storeinfo"]["phoneno"]}, '#{params.as_json["storeinfo"]["storeincharge"]}',#{params.as_json["storeinfo"]["contactno"]}, #{newStore.as_json[0]["max"]}, #{current_user.id}, current_timestamp, current_timestamp)"
        ActiveRecord::Base.connection.execute(insert_query)

        format.html { redirect_to :controller => "productinfos", :action => "index", notice: 'Storeinfo was successfully created.' }
        format.json { render :show, status: :created, location: @storeinfo }
      else
        format.html { render :new }
        format.json { render json: @storeinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storeinfos/1
  # PATCH/PUT /storeinfos/1.json
  def update
    respond_to do |format|
      if @storeinfo.update(storeinfo_params)
        format.html { redirect_to @storeinfo, notice: 'Storeinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @storeinfo }
      else
        format.html { render :edit }
        format.json { render json: @storeinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storeinfos/1
  # DELETE /storeinfos/1.json
  def destroy
    @storeinfo.destroy
    respond_to do |format|
      format.html { redirect_to storeinfos_url, notice: 'Storeinfo was successfully destroyed.' }
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
    def set_storeinfo
      @storeinfo = Storeinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storeinfo_params
      params.require(:storeinfo).permit(
          :storename, :address, :phoneno, :buisnessid, :branchcount, :storeincharge, :contactno, :image, :user_id)
    end
end
