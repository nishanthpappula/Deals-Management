class UploadsController < ApplicationController
  before_action :set_upload, only: [ :edit, :update, :destroy]

 
  # GET /uploads
  def index
     # @uploads = if params[:location].present?
      @uploads = Upload.search(params[:location]).paginate(page: params[:page],per_page:2)
      unless @uploads.present?
         flash[:notice] = "Sorry There are no deals available"
      end
    
  end
 
  # GET /uploads/1
  def show
     @uploads = Upload.where(uploaded_by: @current_user)

     @uploads_pag = @uploads.paginate(page: params[:page],per_page:1)
  end
  def show_uploads 
      @uploads = Upload.find(params[:id])
  end
 def deals
      @uploads = Upload.find(params[:id])
  end

  def admin_crud
      @uploads = Upload.paginate(page: params[:page],per_page:2)
  end

 
  # GET /uploads/new
  def new
    @upload = Upload.new
  end
 
  # GET /uploads/1/edit
  def edit

  end

  
 
  # POST /uploads
  def create
    @upload = Upload.new(post_upload_params)
    @upload.uploaded_by_id = @current_user.id
 
    if @upload.save
      flash[:success] = 'Upload was successfully created.'
      redirect_to users_users_dashboard_path
    else
      render 'new'
    end

  end

 

  def update
    @upload = Upload.find(params[:id])

    if @upload.update(post_upload_params)
      flash[:success] = 'Upload was successfully updated.'
      redirect_to upload_path(@upload)
      
    else
      render 'edit'
    end
  end
 
  # DELETE /uploads/1
  def reject
    @uploads = Upload.find(params[:id])
    @uploads.destroy
    flash[:danger] = "Deleted"
    redirect_to upload_path(@uploads)
  end

  def delete
    @uploads = Upload.find(params[:id])
    @uploads.destroy
    flash[:danger] = "Deleted"
    redirect_to uploads_admin_crud_path(@uploads)

  end


 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_upload_params
      params.require(:upload).permit(:name,:name_of_product,:original_cost,:present_cost,:description_of_product,:stocks_left,:offer_deadline,:location,:street)
    end
end
#
#
