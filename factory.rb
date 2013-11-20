class Factory 

  def initialize(*args)
    Customer.class_eval do
      define_method "initialize" do |*elems|
	  end
	  args.each do |arg|
		attr_accessor arg.to_sym
		define_method "[]" do |arg|
          self.public_send(arg)
	    end
	  end
    end
  end

end

class Customer

end
 

Сustomer = Factory.new(:name, :address, :zip)
joe = Customer.new("Joe", "Maple st.")
puts joe.name

