require './spec/spec_helper'

describe Rsack::Server do 
	def server
		Rack::MockRequest.new(Rsack::Server.new)
	end

	context '/' do 

		it "Codigo 200" do 
			response = server.get('/')
			response.status.should == 200
		end

		it "RPS" do 
			response = server.get('/')
			response.header == 'Piedra, Papel, Tijeras'
		end
	end
end
