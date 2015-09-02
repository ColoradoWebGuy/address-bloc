require_relative 'entry' # relative custom Entry class
require "csv" # import CSV object to parse CSV files

class AddressBook
    attr_accessor :entries

    def initialize
      @entries = []
    end

    # Add individual entries
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

    # Import from CSV files
    def import_from_csv(file_name)
       csv_text = File.read(file_name)
       csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

       csv.each do |row|
         row_hash = row.to_hash
         add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
       end
    end

    # Search AddressBook for a specific entry by name by doing the Binary Search
    def binary_search(name)
      lower = 0
      upper = entries.length - 1

      while lower <= upper
        mid = (lower + upper) / 2
        mid_name = entries[mid].name

        if name == mid_name
          return entries[mid]
        elsif name < mid_name
          upper = mid - 1
        elsif name > mid_name
          lower = mid + 1
        end
      end

     return nil
    end

    # Search AddressBook for a specific entry by name by doing the Iterative Search
    def iterative_search(name)
      # Starting from the first entry in AddressBook.entries, iterate over
      # the entries until you find the match. When the match is found,
      # return it. If no match is ever found, return nil.

      index = 0 # start from the first entry
      while index < entries.length
        index_name = entries[index].name
        if name == index_name
          return entries[index]
        else
          index = index + 1 # move to the next entry in the array
        end
      end

      return nil
    end
end
