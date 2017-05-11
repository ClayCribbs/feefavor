class DocumentSearchTypesController < ApplicationController
  before_action :set_document_search_type, only: [:show, :edit, :update]

  def index
    @document_search_types = DocumentSearchType.all
  end

  def show
  end

  def new
    @document_search_type = DocumentSearchType.new
  end

  def edit
    @fields = @document_search_type.fields
  end

  def create
    @document_search_type = DocumentSearchType.new(document_search_type_params)
    if @document_search_type.save
      redirect_to @document_search_type, notice: 'Document search type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @document_search_type.update(document_search_type_params)
      redirect_to @document_search_type, notice: 'Document search type was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_document_search_type
    @document_search_type = DocumentSearchType.find(params[:id])
  end

  def document_search_type_params
    params.require(:document_search_type).permit(:name, fields_attributes: [:id, :name, :field_type, :required, :_destroy ])
  end
end
