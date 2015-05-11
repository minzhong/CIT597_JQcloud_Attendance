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
        @word_cloud = []
        @word_cloud[1]= {}
        @word_cloud[2]= {}

        attendance_count =  Course.find(params[:id]).attendances.group(:att_date).count
        syllabus_weekly = {"1/16/15"=>"InternetWeb", "1/21/15"=>"Validation", "1/23/15"=>"Migration"}

	i = 0
        attendance_count.each do |k, v| 
         	@word_cloud[i]= {}
                @word_cloud[i]["weight"] = v
		i += 1
	end

	i = 0
        syllabus_weekly.each do |k, v| 
                @word_cloud[i]["text"] = v
		i += 1
	end

        # assign hash_value to @word_cloud[0]["weight"] = num
        #@word_cloud[0]= {}
        #@word_cloud[0]["text"] = "InteretWeb"
        #@word_cloud[0]["weight"] = 4 

        #@word_cloud[1]= {}
        #@word_cloud[1]["text"] = "Validation"
        #@word_cloud[1]["weight"] = 6 

        #@word_cloud[2]= {}
        #@word_cloud[2]["text"] = "Migration"
        #@word_cloud[2]["weight"] = 2 

        #@word_cloud[3]= {}
        #@word_cloud[3]["text"] = "ActiveRecord"
        #@word_cloud[3]["weight"] = 6 

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
