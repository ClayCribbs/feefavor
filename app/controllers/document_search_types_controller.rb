class DocumentSearchTypesController < ApplicationController
  before_action :set_document_search_type, only: [:show, :edit, :update, :destroy]

  # GET /document_search_types
  # GET /document_search_types.json
  def index
    @document_search_types = DocumentSearchType.all
  end

  # GET /document_search_types/1
  # GET /document_search_types/1.json
  def show
  end

  # GET /document_search_types/new
  def new
    @document_search_type = DocumentSearchType.new
  end

  # GET /document_search_types/1/edit
  def edit
  end

  # POST /document_search_types
  # POST /document_search_types.json
  def create
    @document_search_type = DocumentSearchType.new(document_search_type_params)

    respond_to do |format|
      if @document_search_type.save
        format.html { redirect_to @document_search_type, notice: 'Document search type was successfully created.' }
        format.json { render :show, status: :created, location: @document_search_type }
      else
        format.html { render :new }
        format.json { render json: @document_search_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_search_types/1
  # PATCH/PUT /document_search_types/1.json
  def update
    respond_to do |format|
      if @document_search_type.update(document_search_type_params)
        format.html { redirect_to @document_search_type, notice: 'Document search type was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_search_type }
      else
        format.html { render :edit }
        format.json { render json: @document_search_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_search_types/1
  # DELETE /document_search_types/1.json
  def destroy
    @document_search_type.destroy
    respond_to do |format|
      format.html { redirect_to document_search_types_url, notice: 'Document search type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_search_type
      @document_search_type = DocumentSearchType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_search_type_params
      params.require(:document_search_type).permit(:name)
    end
end
