require './lib/rps.rb'


builder = Rack:: Builder.new do
	use Rack::Static, :urls => ['/public']
	use Rack::ShowExceptions
	use Rack::Lint
	run PPT::App.new
	use Rack::Session::Cookie,
		:key => 'rack.session',
		:domain => 'rps.com',
		:secret => 'some_secret',
		:expire_after => 30

	run PPT::App.new
end

use Rack::Server.start(
	:app => builder,
	:Port => 8080,
	:server => 'thin',
	:host => 'www.rps.com'
	)
