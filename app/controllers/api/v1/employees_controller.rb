
module Api::V1 
  class EmployeesController < ActionController::API
    before_action :set_employee, only: [:show, :update, :destroy]

    # GET /api/v1/employees
    def index
      @employees = Employee.all
      render json: @employees
    end

    def create
      @employee = Employee.new(employee_params)
      @employee.save
      render json: @employee, status: :created
    end

    def show
      render json: @employee
    end

    def update
    end

    def destroy
    end

    protected
      def employee_params
        params.require(:employee).permit(:name, :email, :phone)
      end

      def set_employee
        @employee = Employee.find(params[:id])
      end
  end
end
