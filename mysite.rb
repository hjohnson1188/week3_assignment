require 'rack'

#class MySite 
class Home
	def call(env)
		headers = {"Content-Type" => "text/html"}
		content = get_content
		[200, headers, [content] ]	
	end
	
private
	def get_content
		%Q{
	<h1>Heather Johnson</h1>
<p>Current Mobile Software Developer Program student at Chippewa Valley Technical College</p>
		
		}
	end
end

class About
	def call(env)
		headers = {"Content-Type" => "text/html"}
		content = get_content
		[200, headers, [content] ]	
	end
	
private
	def get_content
		%Q{
		<h1>About</h1>
		<p>This is the about page</p>
		}
	end
end

class Resume
	def call(env)
		headers = {"Content-Type" => "text/html"}
		content = get_content
		[200, headers, [content] ]	
	end
	
private
	def get_content
		%Q{
	<h1>Heather Johnson's Resume</h1>
<h2>Current Languages Known:</h2>
	<ul>
		<li>HTML</li>
		<li>JavaScript</li>
		<li>Jquery</li>
		<li>CSS</li>
	</ul>
<h2>Currently Working On:</h2>
	<ul>
		<li>Ruby</li>
		<li>Swift</>
	</ul>
		}
	end
end
	

app = Rack::Builder.new do


map "/" do
		run Home.new
	end
	
map "/about_me" do
		run About.new
	end
	
#map "/resume" do
	#run Resume.new
	#end

#map "/contact" do
	#run Contact.new
	#end

#map "/submit_contact" do
	#run SubmitContact.new
	#end
end

server = Rack::Server.new(:app => app, :server => :webrick)
server.start