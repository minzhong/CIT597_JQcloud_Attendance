class DatetopicsController < ApplicationController
  before_action :set_datetopic, only: [:show, :edit, :update, :destroy]

  # GET /datetopics
  # GET /datetopics.json
  def index
    @datetopics = Datetopic.all
  end

  # GET /datetopics/1
  # GET /datetopics/1.json
  def show
  end

  # GET /datetopics/new
  def new
    @datetopic = Datetopic.new
  end

  # GET /datetopics/1/edit
  def edit
  end
  
  def import
    Datetopic.import(params[:file], params[:course][:id])
    course = Course.find_by_id(params[:course][:id])
    @course_name = course.course_code
    @datetopics = Datetopic.where("course_id = ?", params[:course][:id])
  end

  # POST /datetopics
  # POST /datetopics.json
  def create
    @datetopic = Datetopic.new(datetopic_params)

    respond_to do |format|
      if @datetopic.save
        format.html { redirect_to @datetopic, notice: 'Datetopic was successfully created.' }
        format.json { render :show, status: :created, location: @datetopic }
      else
        format.html { render :new }
        format.json { render json: @datetopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datetopics/1
  # PATCH/PUT /datetopics/1.json
  def update
    respond_to do |format|
      if @datetopic.update(datetopic_params)
        format.html { redirect_to @datetopic, notice: 'Datetopic was successfully updated.' }
        format.json { render :show, status: :ok, location: @datetopic }
      else
        format.html { render :edit }
        format.json { render json: @datetopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datetopics/1
  # DELETE /datetopics/1.json
  def destroy
    @datetopic.destroy
    respond_to do |format|
      format.html { redirect_to datetopics_url, notice: 'Datetopic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datetopic
      @datetopic = Datetopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datetopic_params
      params.require(:datetopic).permit(:date, :topic, :course_id)
    end
end
