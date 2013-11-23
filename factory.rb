class Factory 

  def initialize(*args, &block)
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
          raise "Invalid argument"
        end
      end
      args.each do |arg|
        attr_accessor arg.to_sym    
      end
    class_eval(&block) if block_given?
    end
  end

end

class Customer

end
 

Сustomer = Factory.new(:name, :address, :zip) do
  def greeting
    puts "Hello, #{name}!"
  end
end
Customer.new("Joe", "Maple st.", 12345).greeting
joe = Customer.new("Joe", "Maple st.", 12345)
puts joe[:name]
puts joe["address"]
puts joe[2]

