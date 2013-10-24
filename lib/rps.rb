require 'rack/request'
require 'rack/response'
require 'haml'
require 'thin'
require 'rack'
require 'sinatra'
  
module PPT
	class App
		#Inicializacion de variables de la clase.
		def initialize(app = nil)
			@app = app
			@defeat = {'Piedra' => 'Tijeras', 'Papel' => 'Piedra', 'Tijeras' => 'Papel'}
			@throws = []
		end
		
		#Acceso al archivo HAML para mostrar los resultados
		def haml(template, info)
		  template_file = File.open(template, 'r')
		  Haml::Engine.new(File.read(template_file)).render({},info)
		end
		
		#Llamada del Rack con su enviroment.
		def call(env)
			req = Rack::Request.new(env)
			answer = ''
			computer_throw = ''
			player_throw = req.GET["choice"]
			@throws = @defeat.keys

			if !@throws.include?(player_throw)
				do_it = "Elige jugador"
			else
				computer_throw = @throws.sample
			end
			
			if ( player_throw == computer_throw )
				answer = "empate"
			elsif ( computer_throw == @defeat[player_throw] )
				answer = "jugador gana"
			else
				answer = "jugador pierde"
			end

			info = {
				:do_it => do_it,
				:answer => answer,
				:throws => @throws,
				:computer_throw => computer_throw,
				:player_throw => player_throw
				}
				
			res = Rack::Response.new(haml("./views/index.html.haml", info))
			
		end
	end
end
