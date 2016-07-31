require 'rack'

#class MySite 
class Home
	def call(env)
		headers = {"Content-Type" => "text/html", }
		content = get_content
		[200, headers, [content] ]	
	end
	
private
	def get_content
		%Q{

	<h1>Heather Johnson</h1>

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
			<p>Current Mobile Software Developer Program student at Chippewa Valley Technical College</p>
			<p>Figure Skating Coach</p>
			<p>Trusted babysitter by many</p>
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
		<h2>Experience:</h2>
			<p>None so far</p>
		<h2>Education:</h2>
			<p>In Progress: Mobile Software Program - Chippewa Valley Technical College</p>
			<p>Compleated: Bachelors of Arts in Psychology and Child Development - University Of Wisconsin Eau Claire</p>
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

class Contact
	def call(env)
		headers = {"Content-Type" => "text/html"}
		content = get_content
		[200, headers, [content] ]	
	end
	
private
	def get_content
		%Q{
	<h1>How to Get In Touch with Heather</h1>
<p>Email: <a href = "mailto:heather@johnsonch.com">heather@johnsonch.com</a></p>
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
	
map "/resume" do
	run Resume.new
	end

map "/contact" do
	run Contact.new
	end

#map "/submit_contact" do
	#run SubmitContact.new
	#end
end

server = Rack::Server.new(:app => app, :server => :webrick)
server.start