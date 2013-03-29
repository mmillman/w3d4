require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class User
  attr_accessor :fname, :lname, :is_instructor
  attr_accessor :id #figure out how to protect this later

  def self.find_all
    query = "SELECT * FROM users"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM users WHERE id = ?"
    row_hash_result = QuestionsDatabase.instance.execute(query, id)
    row_hash_result.empty? ? nil : parse(row_hash_result[0])
  end

  def self.parse(row_hash)
    user = User.new(fname: row_hash["fname"],
                    lname: row_hash["lname"],
                    is_instructor: row_hash["is_instructor"],
                    id: row_hash["id"])
  end

  def self.save(user)
    #INSERT a user object into database
    query = <<-SQL
      INSERT INTO users (id, fname, lname, is_instructor)
      VALUES (NULL, "#{user.fname}", "#{user.lname}", "#{user.is_instructor}")
    SQL
    QuestionsDatabase.instance.execute(query)

    true
  end

  def initialize(options = {})
    @fname, @lname = options[:fname], options[:lname]
    @id = options[:id]
    @is_instructor = options[:is_instructor]
  end

  def asked_questions
    query = <<-SQL
      SELECT *
        FROM questions
       WHERE user_id = ?
    SQL

    question_list = QuestionsDatabase.instance.execute(query, self.id)
    question_list.map do |question|
      Question.parse(question)
    end

  end

  def average_karma
  end

end