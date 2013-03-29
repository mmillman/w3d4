require 'sqlite3'
require_relative 'aa_questions'

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_all
    query = "SELECT * FROM questions"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM questions WHERE id = #{id}"
    row_hash_result = QuestionsDatabase.instance.execute(query)
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

end
