class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    # puts "params[:course][:id] is: #{params[:course][:id]}"
    # @course = Course.find_by_id(params[:course][:id])
#     @students = @course.students
  end

  # import the student roster for the newly created course, session can only be used in controllers not models
  def import
    Student.import(params[:file], params[:course][:id])
    @course = Course.find_by_id(params[:course][:id])
    @students = @course.students
    # redirect_to show_students_url, notice: "Students imported successfully."
  end
  

  # GET /students/1
  # GET /students/1.json
  def show
  end

 # GET /graphing/1
 # GET /graphing/1.json
  def graphing2
        @student_email = Student.find(params[:id])[:email]
        @student_note = Student.find(params[:id])[:note]
	@student_name = Student.find(params[:id])[:first_name] + " " + Student.find(params[:id])[:last_name] 
        @graphing = Hash.new()

        @current_course = Course.find_by_id(params[:course_id])[:course_code] + "  "
        @current_course += Course.find_by_id(params[:course_id])[:course_name] 

        @course = Course.find_by_id(params[:course_id])
        @students_count = @course.students.count
        @graphing["#{@student_name}'s Attendance"] = Student.find(params[:id]).attendances.where("course_id= ?", params[:course_id]).count

        @hash_ave =  Attendance.where(:course_id=>params[:course_id]).group(:student_id).count
        @class_ave = @hash_ave.inject(0){|sum, tuple| sum += tuple[1]}
        @graphing["Average Attendance"] = (@hash_ave.inject(0){|sum, tuple| sum += tuple[1]})/@students_count

        @graphing["Total Attendance"] =Attendance.where("course_id=?", params[:course_id]).group(:att_date).count.size 
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
        # Add the course just created to this student's courses, better use the drop down list 
        if params[:course] != nil then
          @student.courses << Course.find(params[:course][:id])
        end
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to import_students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :pennid, :email, :note, :id)
    end
end
