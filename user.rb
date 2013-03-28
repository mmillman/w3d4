require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class User
  attr_accessor :fname, :lname, :is_instructor
  attr_reader :id

  def self.get_all_users
    query = "SELECT * FROM users"
    result = AA_QuestionsDatabase.instance.execute(query)
  end

  def self.get_by_id(id)
    query = "SELECT * FROM users WHERE id = #{id}"
    result = AA_QuestionsDatabase.instance.execute(query)
    result.empty? ? nil : parse(result[0])
  end

  def self.parse(result)
    user = User.new(result["fname"], result["lname"], result["is_instructor"])
    user.id = result["id"]
    user
  end

  def self.save(user)
    #INSERT a user object into database
    query = <<-SQL
      INSERT INTO users (id, fname, lname, is_instructor)
      VALUES (NULL, "#{user.fname}", "#{user.lname}", "#{user.is_instructor}")
    SQL
    AA_QuestionsDatabase.instance.execute(query)
  end

  def initialize(fname, lname, is_instructor)
    @fname, @lname = fname, lname
    @id = nil
    @is_instructor = is_instructor
  end

  def average_karma
  end

  # def get_users
  #   AA_QuestionsDatabase.instance.execute("SELECT * FROM users")
  # end

end