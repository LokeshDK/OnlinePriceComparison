class ProductinfosImportsController < ApplicationController

  def new
    @branchinfo = Branchinfo.find(params[:branchinfo_id])
    @productinfos_import = ProductinfosImport.new

    flash[:someval] = @branchinfo.id
  end

  def create
    @productinfos_import = ProductinfosImport.new(params[:productinfos_import])
    if @productinfos_import.save
      redirect_to productinfos_path(:branchinfo_id => flash[:someval])
    else
      render :new
    end
  end
end
