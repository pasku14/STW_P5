require './lib/rps.rb'

builder = Rack::Builder.new do
	use Rack::Static, :urls => ['/public']
	use Rack::ShowExceptions
	use Rack::Lint
	run PPT::App.new
end

Rack::Handler::Thin.run builder
