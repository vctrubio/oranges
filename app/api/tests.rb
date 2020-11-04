class Tests < Api
	format :json
	default_format :json

	namespace :tests, desc: 'Posts related CRUD operations' do

		get '/' do
			{ 
				status: true,
				message: 'Test api tested'
			}
		end

		get '/hello' do
			{ 
				status: true,
				message: 'Hello test api tested'
			}
		end
	end
end