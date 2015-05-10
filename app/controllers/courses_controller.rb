class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /courses
  # GET /courses.json
  def index
    @current_user_id = current_user.id
    # find will only raise exception when record not found, find_by_id will return nil if record not found.
    if Course.find_by_user_id(@current_user_id).nil? then 
      @courses = nil
    else
      @courses = Course.where("user_id = #{@current_user_id}")
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new, create an empty object
  def new
    @course = Course.new
  end


 def cloud
        @word1 = "internetWeb"
        @size1 = 10
        @word2 = "RubyOnRails"
        @size2 = 5
        @word3 = ""
        @size3 = 0
        @word4 = ""
        @size4 = 0
        @word5 = ""
        @size5 = 0
        @word6 = ""
        @size6 = 0
        @word7 = ""
        @size7 = 0
        @word8 = ""
        @size8 = 0
        @word9 = ""
        @size9 = 0
        @word10 = ""
        @size10 = 0
        @word11 = ""
        @size11 = 0
        @word12 = ""
        @size12 = 0
        @word13 = ""
        @size13 = 0
        @word14 = ""
        @size14 = 0
        @word15 = ""
        @size15 = 0
        @word16 = ""
        @size16 = 0
        @word17 = ""
        @size17 = 0
        @word18 = ""
        @size18 = 0
        @word19 = ""
        @size19 = 0
        @word20 = ""
        @size20 = 0
        @word21 = ""
        @size21 = 0
  end


  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)   
    # below is the way user_id are saved through nested resources
    # @course.user_id = params[:user_id]
    # below, the user_id is provided by devise's current_user helper when you add before_filter :authenticate_user! to the controller
    @course.user_id = current_user.id

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
        # Save the 
        session[:current_course_id] = @course.id
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_code, :course_name, :term, :year, :note)
    end
    
end
