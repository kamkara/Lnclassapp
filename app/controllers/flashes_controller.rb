class FlashesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course, only: %i[new show]
  before_action :set_flash, only: %i[ show edit update destroy ]

  # GET /flashes or /flashes.json
  def index
    @flashes = Flash.all
  end

  # GET /flashes/1 or /flashes/1.json
  def show
  end

  # GET /flashes/new
  def new
    @flash = Flash.new
  end

  # GET /flashes/1/edit
  def edit
  end

  # POST /flashes or /flashes.json
  def create
    @flash = current_user.flashes.build(flash_params)

    respond_to do |format|
      if @flash.save
        format.html { redirect_to flash_url(@flash), notice: "Flash was successfully created." }
        format.json { render :show, status: :created, location: @flash }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flashes/1 or /flashes/1.json
  def update
    respond_to do |format|
      if @flash.update(flash_params)
        format.html { redirect_to flash_url(@flash), notice: "Flash was successfully updated." }
        format.json { render :show, status: :ok, location: @flash }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashes/1 or /flashes/1.json
  def destroy
    @flash.destroy

    respond_to do |format|
      format.html { redirect_to flashes_url, notice: "Flash was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash
      @flash = Flash.friendly.find(params[:id])
    end

    #Find course
    def find_course
      @course = Course.all
    end

    # Only allow a list of trusted parameters through.
    def flash_params
      params.require(:flash).permit(:title, :content, :slug, :user_id, :course_id)
    end
end