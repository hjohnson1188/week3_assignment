require 'rack'






server = Rack::Server.new(:app => app, :server => :webrick)
server.start