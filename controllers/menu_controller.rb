require_relative '../models/address_book'

class MenuController
  attr_accessor :addressbook

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View Entry Number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    puts "Enter your selection: "

    selection = gets.to_i

    case selection
     when 1
       system "clear"
       view_all_entries
       main_menu
     when 2
       system "clear"
       view_an_entry # view a certain Number
       main_menu
     when 3
       system "clear"
       create_entry
       main_menu
     when 4
       system "clear"
       search_entries
       main_menu
     when 5
       system "clear"
       read_csv
       main_menu
     when 6
       puts "Good-bye!"
       # terminate the program using exit(0). 0 signals the program is exiting without an error.
       exit(0)
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
     end
   end

   def view_an_entry
     system "clear"
     puts "Enter an entry number to display (first entry starts at 0):"
     entry_id = gets.chomp.to_i

     # See if ID exists.
     if @address_book.entries[entry_id]
       system "clear"
       puts @address_book.entries[entry_id].to_s
     else
       system "clear"
       puts "Sorry, that entry number is doesn't exist. Please try a different entry number."
     end

     puts "End of entry request \n\n"
   end

   def view_all_entries
     @address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s

       entry_submenu(entry)
     end

     system "clear"
     puts "End of entries"
   end

   def create_entry
     system "clear"
     puts "New AddressBloc Entry"

     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp

     @address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end

   def search_entries
   end

   def read_csv
   end

   def entry_submenu(entry)
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp #chomp removes any trailing whitespace from the string gets returns.

     case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
      end
    end
end
