class EnrollementsController < ApplicationController
  before_action :set_enrollement, only: %i[ show edit update destroy ]
  before_action :set_coruse, only: [:new, :create]

  # GET /enrollements or /enrollements.json
  def index
    @enrollements = Enrollement.all
  end

  #
  def show
  end

  # GET /enrollements/new
  def new
    @enrollement = Enrollement.new
  end

  # GET /enrollements/1/edit
  def edit
  end

 
  def create
   
    if @course.price > 0
      flash[:alert] = "You can not access paid course yet."
      redirect_to new_course_enrollement_path(@course)
    else
      @enrollement = current_user.buy_course(@course)
      redirect_to course_path(@course), notice: "You are enrolled" 
    end
  end

  # PATCH/PUT /enrollements/1 or /enrollements/1.json
  def update
    respond_to do |format|
      if @enrollement.update(enrollement_params)
        format.html { redirect_to @enrollement, notice: "Enrollement was successfully updated." }
        format.json { render :show, status: :ok, location: @enrollement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrollement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollements/1 or /enrollements/1.json
  def destroy
    @enrollement.destroy
    respond_to do |format|
      format.html { redirect_to enrollements_url, notice: "Enrollement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_coruse
      @course = Course.Friendly.find(params[:course_id])
    end

    def set_enrollement
      @enrollement = Enrollement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollement_params
      params.require(:enrollement).permit(:rating, :review)
    end
end
