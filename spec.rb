# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if @middle_name == nil
      "#{@first_name} #{@last_name}"
    else
      "#{@first_name} #{@middle_name} #{@last_name}"
    end
  end

  def full_name_with_middle_initial
    if @middle_name == nil
      "#{@first_name} #{@last_name}"
    else
      "#{@first_name} #{@middle_name[0]}. #{@last_name}"
    end
  end

  def initials
    if @middle_name == nil
      "#{@first_name[0]}#{@last_name[0]}"
    else
      "#{@first_name[0]}#{@middle_name[0]}#{@last_name[0]}"
    end
  end
  # implement your behavior here
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Jeb", middle_name: "Corbett", last_name: "Elliott")
      expect(person.full_name).to eq("Jeb Corbett Elliott")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Jeb", last_name: "Elliott")
      expect(person.full_name).to eq("Jeb Elliott")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle initial, and last name with spaces and period after middle initial" do
      person = Person.new(first_name: "Jeb", middle_name: "Corbett", last_name: "Elliott")
      expect(person.full_name_with_middle_initial).to eq("Jeb C. Elliott")
    end

    it "does not add extra spaces or period if middle name is missing" do
      person = Person.new(first_name: "Jeb", last_name: "Elliott")
      expect(person.full_name_with_middle_initial).to eq("Jeb Elliott")
    end
  end

  describe "#initials" do
    it "concatenates the first letter of first name, middle name, and last name" do
      person = Person.new(first_name: "Jeb", middle_name: "Corbett", last_name: "Elliott")
      expect(person.initials).to eq("JCE")
    end

    it "only returns two characters if middle name is missing" do
      person = Person.new(first_name: "Jeb", last_name: "Elliott")
      expect(person.initials).to eq("JE")
    end
  end
end
