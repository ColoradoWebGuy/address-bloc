require_relative 'entry'

class AddressBook
    attr_accessor :entries

    def initialize
      @entries = []
    end

    def add_entry(name, phone_number, email)
     index = 0
     @entries.each do |entry|
       if name < entry.name
         break
       end
       index += 1
     end
     @entries.insert(index, Entry.new(name, phone_number, email))
   end

   def remove_entry(name, phone_number, email)
     #  Iterate over @entries until you find the match.
     index = 0
     @entries.each do |entry|
       if (name == entry.name) && (phone_number == phone_number) && (email == email)
         break
       end
       index += 1
     end
     #Use the index of the match to remove the entry from @entries.
     @entries.delete_at(index)
   end

end
