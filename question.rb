require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class Question
  attr_accessor :title, :body, :author_id
  attr_accessor :question_id #figure out how to protect this later

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
    question = Question.new(title: row_hash["title"],
                            body: row_hash["body"],
                            author_id: row_hash["author_id"],
                            question_id: row_hash["question_id"])
  end

  def initialize(options = {}) #title, body, author_id, question_id)
    @title, @body = options[:title], options[:body]
    @question_id = options[:question_id]
    @author_id = options[:author_id]
  end

end
