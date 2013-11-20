class Factory 

  def initialize(*args)
    Customer.class_eval do
      define_method "initialize" do |*elems|
      	args.each_with_index do |arg,index|
      	  elems.each_with_index do |elem, index2|
      	  	if index2 == index
      	  self.public_send("#{arg}=",elem[index2])
      	end
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

