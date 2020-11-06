class Employees < Api
	format :json
	default_format :json

	namespace :employees, desc: 'Employees related CRUD operations' do

		desc 'Fetch all employees'
		get '/' do
			@employees = Employee.all
			if @employees.present?
				{ data: @employees, status: true }
			else
				error!({ status: false, message: 'Employee list is empty, Please add an employee' }, 400)
			end
		end

		desc 'Fetch single employee'
		get '/:id' do
			@employee = Employee.find_by(id: params[:id])
			if @employee.present?
				{ data: @employee.employee_data, status: true }
			else
				error!({ status: false, message: 'Employee with this id not found' }, 400)
			end
		end

		desc 'Create an employee'
		params do
			requires :name, type: String, desc: 'Name'
			requires :phone, type: String, desc: 'Phone'
			requires :credit, type: String, desc: 'Credit'
			requires :description, type: String, desc: 'Description'
			requires :inactive, type: Boolean, desc: 'Inactive'
		end

		post '/' do
			@employee = Employee.new(params)
			if @employee.credit.nil? 
				@employee.credit = 0
			end
			if @employee.save
				{ data: @employee, message: 'Employee was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update an employee'
		params do
			requires :name, type: String, desc: 'Name'
			requires :phone, type: String, desc: 'Phone'
			requires :credit, type: String, desc: 'Credit'
			requires :description, type: String, desc: 'Description'
			requires :inactive, type: Boolean, desc: 'Inactive'
		end
		put '/:id' do
			@employee = Employee.find_by(id: params[:id])
			if @employee && @employee.update(params)
				{ data: @employee, message: 'Employee was successfully updated.', status: true}
			else
				error!({ status: false, message: 'Employee with this id not found' }, 400)
			end
		end

		desc 'Delete an employee'
		delete '/:id' do
			@employee = Employee.find_by(id: params[:id])
			if @employee && @employee.delete
				{ data: @employee, message: 'Employee was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'Employee with this id not found' }, 400)
			end
		end

		desc 'Make Active/Inactive an employee'
		put '/active/:id' do
			@employee = Employee.find_by(id: params[:id])
			if @employee && @employee.update(inactive: params[:inactive])
				{ data: @employee, message: 'Employee was successfully updated.', status: true}
			else
				error!({ status: false, message: 'Employee with this id not found' }, 400)
			end
		end

	end
end