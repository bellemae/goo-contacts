require 'nokogiri'
require 'open-uri'

class Contacts

  #get and parse the contacts with your access token
  def get token
  	url = "https://www.google.com/m8/feeds/contacts/default/full?client_id=#{Rails.application.secrets.client_id}&access_token=#{token}"

    contacts = [] #keeps track of all the contacts


 	  doc = Nokogiri::HTML(open(url))
    doc.css('entry').each do |item|
       

      #get contact name
      name = item.xpath('./title').text

      #get contact email addresses
      email_addresses = []
      i = 0
      item.xpath('./email').each do |email|
        email_addresses << item.xpath('./email')[i].attributes['address'].inner_text
        i+=1
      end
 
      #get phone numbers
      j = 0
      phone_numbers = []
      if item.xpath('./phonenumber')[0] != nil
        item.xpath('./phonenumber').each do |number|
          phone_numbers << item.xpath('./phonenumber')[j].children.inner_text
          i +=1
        end
      end      

      contact = Contact.new({
        :name => name,
        :emails => email_addresses,
        :phones => phone_numbers
      })

      contacts.push( contact  )
    end
    contacts  
  end


end