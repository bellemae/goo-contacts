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

  #create a hash represenation of the contact
  def to_hash fields = []
      hash = {}
      strip_fields = []
      self.instance_variables.each{|var| 
          if fields.length > 0
              next unless fields.include? var.to_s.delete("@")
          end
          hash[var.to_s.delete("@")] = self.instance_variable_get(var) unless strip_fields.include? var.to_s
      }
      hash
  end
   

end