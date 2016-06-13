class RequestsController < ApplicationController

  def home
  end


  def new
    @request = Request.new
  end

  def create
    puts params
    request_params = params.require(:request).permit(:name, :email, :department, :message, :completion)
    @request = Request.new request_params
    if @request.save
      # redirect_to the show page
      redirect_to request_path(@request)
      # flash[:notice] = "Question created!"
    else
      # flash[:alert] = "Question not created!"
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def index
    @requests = Request.paginate(:page => params[:page], :per_page => 7)
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    puts @request
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    puts request_params
    if @request.update request_params
      redirect_to requests_path
    else
      render :edit
    end
  end

  def destroy
      @request = Request.find params[:id]
      @request.destroy
      redirect_to requests_path
  end

  def completion
    @request = Request.find params[:id]
    Request.complete @request
    redirect_to requests_path
  end

  def search
    @requests = Request.search(params[:search]).paginate(:page => params[:page], :per_page => 7)
  end
end
