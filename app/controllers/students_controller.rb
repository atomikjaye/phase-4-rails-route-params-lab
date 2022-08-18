class StudentsController < ApplicationController

  def index
    students = Student.all
    students = Student.find_by("lower(first_name) = ? OR lower(last_name) = ? ", params[:name].downcase, params[:name].downcase) if params[:name].present?
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
