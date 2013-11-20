class Factory 

  def initialize(*args)
    Customer.class_eval do
      define_method "initialize" do |*elems|
        elems.each_with_index do |elem, index|
      	  self.public_send("#{args[index]}=",elem)
        end
	  	end
	  	define_method "[]" do |arg|
	  		begin
	  			if arg.class == Fixnum
	  				self.public_send("#{args[arg]}")
	  			else
      			self.public_send(arg)
     	 		end
     	  rescue
     	  	puts "Invalid argument"
     	  end
     	end
	  	args.each do |arg|
		  	attr_accessor arg.to_sym
	  	end
    end
  end

end

class Customer

end
 

Сustomer = Factory.new(:name, :address, :zip)
joe = Customer.new("Joe", "Maple st.", 12345)
puts joe[:name]
puts joe["address"]
puts joe[2]

