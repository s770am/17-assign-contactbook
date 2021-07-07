require_relative 'contact'

class CRM

  def initialize
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
  end
end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
      when 4 then display_all_contacts
        when 5 then search_by_attribute
          when 6 then exit(true)
  end
end
  
    def add_new_contact
      print 'Enter First Name: '
      first_name = gets.chomp
    
      print 'Enter Last Name: '
      last_name = gets.chomp
    
      print 'Enter Email Address: '
      email = gets.chomp
    
      print 'Enter a Note: '
      note = gets.chomp
    
      contact = Contact.create(
  first_name: first_name,
  last_name:  last_name,
  email:      email,
  note:       note
)
  end

  def modify_existing_contact

    puts "enter an id or an attribute"
    id_attra = gets.chomp
    if id_attra.to_i.is_a?(Integer) && id_attra.to_i != 0 
    contact = Contact.find(id_attra.to_i)
    puts "what attribute would you like to change"
    id_attra = gets.chomp
    else 
      puts "what is the current value"
      value = gets.chomp
      contact = Contact.dovs_find_by(id_attra, value)
    end
 puts "enter in the new value"
 nvalue = gets.chomp

 case id_attra
    when "first name"
      contact.update(first_name: nvalue)
    when "last name"
      contact.update(last_name: nvalue)
    when "email"
      contact.update(email: nvalue)
    when "note"
      contact.update(note: nvalue)
    end


  end

  def delete_contact
    puts "enter an id or an attribute"
    id_attra = gets.chomp
    if id_attra.to_i.is_a?(Integer) && id_attra.to_i != 0
    Contact.find(id_attra.to_i).delete
    else 
      puts "what is the value"
      value = gets.chomp
      Contact.dovs_find_by(id_attra, value).delete
    end
  end

  def display_all_contacts
   p Contact.all
  end

  def search_by_attribute
    puts "enter attribute"
    attra = gets.chomp
    puts "enter value"
    value = gets.chomp
    p Contact.dovs_find_by(attra, value)
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu
at_exit do
  ActiveRecord::Base.connection.close
end
