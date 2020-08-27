class EnrollmentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @teachers = @course.enrollments.where(role: "teacher")
    @students = @course.enrollments.where(role: "student")
    @tas = @course.enrollments.where(role: "ta")
    # up to here things are looking good
  end

  def new
  end
end
