require 'swagger_helper'

RSpec.describe Api::V1::EmployeesController, swagger_doc: 'v1/swagger.yaml', type: :request do

  path '/api/v1/employees' do
    post 'Creates a employee' do
      tags 'Employees'
      consumes 'application/json', 'application/xml'
      parameter name: :employee, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string }
        },
        required: [ 'name', 'email' ]
      }


      
      response '201', 'employee created' do
        let(:employee) { { name: 'foo', email: 'foo@bar.com', phone: '(33) 9123-4567' } }
        run_test!
      end
    end
  end

  path '/api/v1/employees/{id}' do

    get 'Retrieves a employee' do
      tags 'Employees'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'employee found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            email: { type: :string },
            phone: { type: :string }
          },
          required: [ 'id', 'name', 'email', 'phone' ]

        let(:id) { Employee.create(name: 'employee test', email: 'foo@bar.com', phone: '(33) 9123-4567').id }
        run_test!
      end
    end
  end
end
