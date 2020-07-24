class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.collect do |student_hash| #.each
      Student.new(student_hash)             #works also
    end
  end
#^students_array is the return value of the .scrape_index_page method in the scraper class. Instead of calling the method we are passing it in which is better
#here we add the name, location, and url
  
  def add_student_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
      end
    self
  end
  #^attributes_hash is the return value of .scrape_profile_page method

  def self.all
    @@all
  end
end
