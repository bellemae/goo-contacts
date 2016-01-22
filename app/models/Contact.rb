class Contact
  attr_reader :name , :phones , :emails

  def initialize args = {}
    args.each do |k,v|
      next if ( k == 'phones' || k == 'emails' ) && v.class != 'Array'
        instance_variable_set("@#{k}",v) unless v.nil?
    end
  end
   
  def to_s
  	"Name: #{name}, Phones: #{phones}, Emails: #{emails}"
  end

end