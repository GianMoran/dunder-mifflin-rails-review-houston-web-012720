class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    employee = Employee.create(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id))

    if employee.valid?
      redirect_to employee
    else
      flash[:errors] = employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id))

    if @employee.valid?
        redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def employee_params(*args)
    params.require(:employee).permit(*args)
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
