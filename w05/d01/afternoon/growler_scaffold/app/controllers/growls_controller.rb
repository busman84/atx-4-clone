class GrowlsController < ApplicationController
  before_action :set_growl, only: [:show, :edit, :update, :destroy]

  # GET /growls
  # GET /growls.json
  def index
    @growls = Growl.all
  end

  # GET /growls/1
  # GET /growls/1.json
  def show
  end

  # GET /growls/new
  def new
    @growl = Growl.new
  end

  # GET /growls/1/edit
  def edit
  end

  # POST /growls
  # POST /growls.json
  def create
    @growl = Growl.new(growl_params)

    respond_to do |format|
      if @growl.save
        format.html { redirect_to @growl, notice: 'Growl was successfully created.' }
        format.json { render :show, status: :created, location: @growl }
      else
        format.html { render :new }
        format.json { render json: @growl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growls/1
  # PATCH/PUT /growls/1.json
  def update
    respond_to do |format|
      if @growl.update(growl_params)
        format.html { redirect_to @growl, notice: 'Growl was successfully updated.' }
        format.json { render :show, status: :ok, location: @growl }
      else
        format.html { render :edit }
        format.json { render json: @growl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growls/1
  # DELETE /growls/1.json
  def destroy
    @growl.destroy
    respond_to do |format|
      format.html { redirect_to growls_url, notice: 'Growl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growl
      @growl = Growl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def growl_params
      params.require(:growl).permit(:message)
    end
end
