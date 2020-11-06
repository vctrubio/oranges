class Landlords < Api
	format :json
	default_format :json

	namespace :landlords, desc: 'Landlord related CRUD operations' do

		desc 'Fetch all landlords'
		get '/' do
			@clients = Client.all
			if @clients.present?
				{ data: @clients, status: true }
			else
				error!({ status: false, message: 'Client list is empty, Please add an client' }, 400)
			end
		end


		desc 'Fetch a single landlord'
		get '/:id' do
			@landlord = Landlord.find_by(id: params[:id])
			if @landlord.present?
				{ data: @landlord, status: true }
			else
				error!({ status: false, message: 'Client with this id not found' }, 400)
			end
		end

		desc 'Create a landlore'
		params do
			requires :name, type: String, desc: 'Name'
			requires :phone, type: String, desc: 'Phone'
			requires :address, type: String, desc: 'Address'
			requires :description, type: String, desc: 'Description'
			requires :fields, type: String, desc: 'Fields'
		end

		post '/' do
			@landlord = Landlord.new(params)
			if @landlord.save
				{ data: @landlord, message: 'Landlord is successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a landlord'
		params do
			requires :name, type: String, desc: 'Name'
			requires :phone, type: String, desc: 'Phone'
			requires :address, type: String, desc: 'Address'
			requires :description, type: String, desc: 'Description'
			requires :fields, type: String, desc: 'Fields'
		end

		post '/:id' do
			@landlord = Landlord.find_by(id: params[:id])
			if @landlord.update(params)
				{ data: @landlord, message: 'Landlord is successfully updated.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end


		desc 'Delete a landlord'
		delete '/:id' do
			@landlord = Landlord.find_by(id: params[:id])
			if @landlord && @landlord.delete
				{ data: @landlord, message: 'Landlord was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'Landlord with this id not found' }, 400)
			end
		end


	end
end