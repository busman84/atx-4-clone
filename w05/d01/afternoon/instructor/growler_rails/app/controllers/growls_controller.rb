class GrowlsController < ApplicationController
  def index
    @growls = Growl.all
  end

  def new
    # displays the form
    @growl = Growl.new
  end

  def show
    @growl = Growl.find(params[:id])
  end

  def create
    # processes the form 
    @growl = Growl.new(growl_params)

    if @growl.save
      redirect_to @growl, notice: 'Growl was successfully created.'
    else
      redirect_to @growl, notice: 'There was an error saving the growl.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growl
      @growl = Growl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def growl_params
      params.require(:growl).permit(:message, :author)
    end
end
