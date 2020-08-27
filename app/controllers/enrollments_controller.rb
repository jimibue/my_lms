class EnrollmentsController < ApplicationController
  before_action :set_course

  def index
    @teachers = @course.enrollments.where(role: "teacher")
    @students = @course.enrollments.where(role: "student")
    @tas = @course.enrollments.where(role: "ta")
    # up to here things are looking good
  end

  def new
    # users that are not enrolled in the active course
    # which fin params[:course_id]
    @enrollment = @course.enrollments.new
    @users = User.all - @course.users
  end

  def create
    @enrollment = @course.enrollments.new(enrollment_params)
    if (@enrollment.save)
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def destroy
    @enrollment = @course.enrollments.find(params[:id])
    @enrollment.destroy
    redirect_to course_enrollments_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:role, :user_id)
  end
end
