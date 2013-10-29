require './spec/spec_helper'

describe Rsack::Server do 
	def server
		Rack::MockRequest.new(Rsack::Server.new)
	end

	#MAIN
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
	
	#Ambito TIJERAS
	context "/?choice='Tijeras'" do
	
		it "Ganar" do 
			computer_throw = 'Papel'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("chuchu")
		end

		it "Perder" do 
			computer_throw = 'Piedra'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Perdiste!!!")
		end

		it "Empatar" do 
			computer_throw = 'Tijeras'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Empate!")
		end
	end
	
		#Ambito PIEDRA
	context "/?choice='Tijeras'" do
	
		it "Ganar" do 
			computer_throw = 'Papel'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Ganaste!")
		end

		it "Perder" do 
			computer_throw = 'Piedra'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Perdiste!!!")
		end

		it "Empatar" do 
			computer_throw = 'Tijeras'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Empate!")
		end
	end
	
		#Ambito PAPEL
	context "/?choice='Tijeras'" do
	
		it "Ganar" do 
			computer_throw = 'Papel'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Ganaste!")
		end

		it "Perder" do 
			computer_throw = 'Piedra'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Perdiste!!!")
		end

		it "Empatar" do 
			computer_throw = 'Tijeras'
			response = server.get("/?choice='Tijeras'")
			response.body.include?("Empate!")
		end
	end
end
