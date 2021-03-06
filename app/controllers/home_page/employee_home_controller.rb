class HomePage::EmployeeHomeController < ApplicationController
  before_action :authenticate_employee!
  before_action :check_whether_password_changed

  layout "home_page"

  def index
    @restaurant = Restaurant.find(current_employee.manager_id)
  end

  def notifications
    respond_to do |format|
      format.html
    end
  end

  private

  def check_whether_password_changed
    # Force employee to change auto-generated password
    unless current_employee.password_changed
      redirect_to edit_employee_registration_path(current_employee)
    end
  end

end
