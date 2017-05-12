class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request       = Request.new
    @request_types = RequestType.all

    @request.build_courthouse
  end

  def edit
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:request_type,
                                    :deadline_at,
                                    courthouse_attributes: [ :name ],
                                    )
  end
end
