class Api::V1::Employees < ActionController::API
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /api/v1/employees
  def index
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  protected
    def set_employee
    end
end
