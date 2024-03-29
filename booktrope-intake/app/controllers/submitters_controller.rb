class SubmittersController < ApplicationController
  before_action :set_submitter, only: [:show, :edit, :update, :destroy]

  # GET /submitters
  # GET /submitters.json
  def index
    @submitters = Submitter.all
  end

  # GET /submitters/1
  # GET /submitters/1.json
  def show
  end

  # GET /submitters/new
  def new
    @submitter = Submitter.new
  end

  # GET /submitters/1/edit
  def edit
  end

  # POST /submitters
  # POST /submitters.json
  def create
    @submitter = Submitter.new(submitter_params)

    respond_to do |format|
      if @submitter.save
        format.html { redirect_to @submitter, notice: 'Submitter was successfully created.' }
        format.json { render :show, status: :created, location: @submitter }
      else
        format.html { render :new }
        format.json { render json: @submitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submitters/1
  # PATCH/PUT /submitters/1.json
  def update
    respond_to do |format|
      if @submitter.update(submitter_params)
        format.html { redirect_to @submitter, notice: 'Submitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @submitter }
      else
        format.html { render :edit }
        format.json { render json: @submitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submitters/1
  # DELETE /submitters/1.json
  def destroy
    @submitter.destroy
    respond_to do |format|
      format.html { redirect_to submitters_url, notice: 'Submitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submitter
      @submitter = Submitter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submitter_params
      params.require(:submitter).permit(:first_name, :last_name, :email, :phone_location_id, :phone_number, :country, :pen_name_first, :pen_name_last)
    end
end
