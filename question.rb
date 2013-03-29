require 'sqlite3'
require_relative 'aa_questions'

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_all
    query = "SELECT * FROM questions"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM questions WHERE id = ?"
    row_hash_result = QuestionsDatabase.instance.execute(query, id)
    row_hash_result.empty? ? nil : parse(row_hash_result[0])
  end

  def self.parse(row_hash)
    question = Question.new(id: row_hash["id"],
                            title: row_hash["title"],
                            body: row_hash["body"],
                            user_id: row_hash["user_id"])
  end

  def initialize(options = {})
    @title, @body = options[:title], options[:body]
    @id = options[:id]
    @user_id = options[:user_id]
  end

  def asking_student
    User.find_by_id(user_id)
  end

  def self.most_followed(n)
    query = <<-SQL
      SELECT COUNT(questions.id), questions.id, title, body, questions.user_id
        FROM questions
        JOIN question_followers
          ON (questions.id = question_id)
    GROUP BY question_id
    ORDER BY 1 DESC
    LIMIT ?
    SQL

    result_hash = QuestionsDatabase.instance.execute(query, n)
    result_hash.map { |result| parse(result) }
  end

  def self.most_liked(n)
    query = <<-SQL
      SELECT COUNT(questions.id), questions.id, title, body, questions.user_id
        FROM questions
        JOIN question_likes
          ON (questions.id = question_id)
    GROUP BY question_id
    ORDER BY 1 DESC
    LIMIT ?
    SQL

    result_hash = QuestionsDatabase.instance.execute(query, n)
    result_hash.map { |result| parse(result) }
  end

  def followers
    query = <<-SQL
      SELECT users.id, fname, lname, is_instructor
        FROM question_followers
        JOIN users
          ON (question_followers.user_id = users.id)
       WHERE question_id = ?
    SQL

    result_hash = QuestionsDatabase.instance.execute(query, self.id)
    result_hash.map { |result| User.parse(result) }
  end

end
