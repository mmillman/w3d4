require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class User
  attr_accessor :fname, :lname, :is_instructor
  attr_accessor :id #figure out how to protect this later

  def self.get_all
    query = "SELECT * FROM users"
    result = AA_QuestionsDatabase.instance.execute(query)
  end

  def self.get_by_id(id)
    query = "SELECT * FROM users WHERE id = #{id}"
    result = AA_QuestionsDatabase.instance.execute(query)
    result.empty? ? nil : parse(result[0])
  end

  def self.parse(result)
    user = User.new(result["fname"], result["lname"],
                    result["is_instructor"], result["id"])
  end

  def self.save(user)
    #INSERT a user object into database
    query = <<-SQL
      INSERT INTO users (id, fname, lname, is_instructor)
      VALUES (NULL, "#{user.fname}", "#{user.lname}", "#{user.is_instructor}")
    SQL
    AA_QuestionsDatabase.instance.execute(query)
  end

  def initialize(fname, lname, is_instructor, id)
    @fname, @lname = fname, lname
    @id = id
    @is_instructor = is_instructor
  end

  def average_karma
  end

end