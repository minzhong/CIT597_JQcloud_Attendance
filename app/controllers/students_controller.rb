class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    # puts "session now is: #{session[:current_course_id]}"
    # @course = Course.find_by_id(session[:current_course_id])
 #    @students = @course.students
    @students = Student.all
  end

  # import the student roster for the newly created course, session can only be used in controllers not models
  def import
    Student.import(params[:file], params[:course][:id])
    # if (:file.empty?) then
#       redirect_to students_url, notice: "Please upload a student roster as a csv file."
#     else
    redirect_to students_url, notice: "Students imported successfully." # this is for the flash notice in student views index.html.erb file
    # end
    
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /graphing/1
  # GET /graphing/1.json
  def graphing
        #@graphing = Student.find(params[:id])
	#@student_email = Student.find(params[:id])
	@graphing = { "total" => 26, "average" => 23, "this_student" => 24} 
  end

  # GET /students/new
  def new
    @student = Student.new
	@graphing = { "total"=>26, "average"=>23, "this_student"=>24} 
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
        @student.courses << Course.find(params[:course][:id])
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
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
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
      params.require(:student).permit(:first_name, :last_name, :pennid, :email, :note)
    end
end
