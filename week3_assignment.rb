require 'rack'

class MySite 
	
	
end

app = MySite.new


map "/" do
		run Home.new
	end
	
map "/about_me" do
		run About.new
	end
	
map "/resume" do
	run Resume.new
	end

map "/contact" do
	run Contact.new
	end

map "/submit_contact" do
	run SubmitContact.new
	end


server = Rack::Server.new(:app => app, :server => :webrick)
server.start