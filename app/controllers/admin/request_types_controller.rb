require 'admin/admin_controller.rb'

class Admin::RequestTypesController < AdminController
  before_action :set_request_type, only: [:show, :edit, :update]

  def index
    @request_types = RequestType.all
  end

  def show
  end

  def new
    @request_type = RequestType.new
  end

  def edit
    @fields = @request_type.fields
  end

  def create
    @request_type = RequestType.new(request_type_params)
    if @request_type.save
      redirect_to admin_request_type_path(@request_type), notice: 'Document search type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @request_type.update(request_type_params)
      redirect_to admin_request_type_path(@request_type), notice: 'Document search type was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_request_type
    @request_type = RequestType.find(params[:id])
  end

  def request_type_params
    params.require(:request_type).permit(:name, fields_attributes: [:id, :name, :field_type, :required, :_destroy ])
  end
end
