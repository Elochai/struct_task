class Factory 

  def initialize(*args)
    Customer.class_eval do
      define_method "initialize" do |*elems|
      	args.each do |arg|
      	  elems.each do |elem|
      	  self.public_send("#{arg}=",elem)
      	end
        end
	  end
	  define_method "[]" do |arg|
        self.public_send(arg)
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
joe = Customer.new("Joe", "Maple st.")
puts joe.name

