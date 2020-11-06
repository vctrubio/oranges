class Totals < Api
	format :json
	default_format :json

	namespace :totals, desc: 'Totals related CRUD operations' do

		desc 'Fetch all totals'
		get '/' do
			@totals = Total.all
			if @totals.present?
				{ data: @totals, status: true }
			else
				error!({ status: false, message: 'Totals list is empty' }, 400)
			end
		end

		desc 'Fetch a single total'
		get '/:id' do
			@totals = Total.find_by(id: params[:id])
			if @totals.present?
				{ data: totals, status: true }
			else
				error!({ status: false, message: 'Total with this id not found' }, 400)
			end
		end

		desc 'Create a total'
		params do
			requires :payment_id, type: String, desc: 'payment_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :pickup_id, type: String, desc: 'pickup_id'
			requires :inflow, type: String, desc: 'inflow'
			requires :outflow, type: Boolean, desc: 'outflow'
			requires :balance, type: Boolean, desc: 'balance'
		end

		post '/' do
			@total = Total.new(params)
			if @total.save
				{ data: @total, message: 'Total was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a total'
		params do
			equires :payment_id, type: String, desc: 'payment_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :pickup_id, type: String, desc: 'pickup_id'
			requires :inflow, type: String, desc: 'inflow'
			requires :outflow, type: Boolean, desc: 'outflow'
			requires :balance, type: Boolean, desc: 'balance'
		end
		put '/:id' do
			@total = Total.find_by(id: params[:id])
			if @total && @total.update(params)
				{ data: @total, message: 'Total was successfully updated.', status: true}
			else
				error!({ status: false, message: 'Total with this id not found' }, 400)
			end
		end

		desc 'Delete a total'
		delete '/:id' do
			@total = Total.find_by(id: params[:id])
			if @total && @total.delete
				{ data: @total, message: 'Total was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'Total with this id not found' }, 400)
			end
		end

	
	end
end