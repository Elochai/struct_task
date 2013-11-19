class Factory 

	def initialize(name, address, zip)
		@name = name
		@address = address
		@zip = Integer(zip)
		@args = [name, address, zip]
		greeting
	end

	def name
		puts @name
	end

	def address
		puts @address
	end

	def zip
		puts @zip
	end

	def greeting
		puts "Hello, #{@name}!"
	end 

	def [] (arg)
		if arg.class == Symbol || arg.class == String
		  self.public_send(arg)
	    elsif arg.class == Fixnum
 		  puts "#{@args[arg]}"  
	    else puts "Invalid argument class"
	    end
	end


end 

Customer = Factory.new("Joe", "Mapple st.", 1234)
Customer[:name]
Customer["address"]
Customer[2]