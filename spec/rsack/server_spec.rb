describe Rsack::Server do 
	def server
		Rack::MockRequest.new(Rsack::Server.new)
	end

	#PRINCIPAL
	context '/' do 

		it "Deberia devolver el codigo 200" do 
			response = server.get('/')
			response.status.should == 200
		end

		it "Deberia mostrar RPS" do 
			response = server.get('/')
			response.header == 'RPS'
		end
	end
end
