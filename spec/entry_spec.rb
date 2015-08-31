require_relative '../models/entry'

# #1 - Describing that the test is a spec file, and that it will tests Entry.
RSpec.describe Entry do
  # #2 - Using the specs in the context to test Entry attributes.
  context "attributes" do
      # #3:
      # Separating our individual tests using the 'it' method.
      #   Each 'it' represents a unique test.
    it "should respond to name" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      # #4:
      # Each RSpec test ends with one or more expect method, which we use
      #   to declare the expectations for the test. If those expectations
      #   are met, our test passes, if they are not, it fails.
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(entry).to respond_to(:email)
    end
  end

  # #5
  # We use a new context to separate the to_s test from the initializer tests
  #  The '#'' in front of to_s indicates that it is an instance method.
  context "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
      # #6 - we use eq to check that to_s returns a string equal to expected_string.
      expect(entry.to_s).to eq(expected_string)
    end
  end

end
