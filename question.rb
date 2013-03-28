require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class Question
  attr_accessor :title, :body, :author_id
  attr_accessor :question_id #figure out how to protect this later

  def self.get_all
    query = "SELECT * FROM questions"
    result = AA_QuestionsDatabase.instance.execute(query)
  end

  def self.get_by_question_id(question_id)
    query = "SELECT * FROM questions WHERE question_id = #{question_id}"
    result = AA_QuestionsDatabase.instance.execute(query)
    result.empty? ? nil : parse(result[0])
  end

  def self.parse(result)
    question = Question.new(result["title"], result["body"],
                            result["author_id"], result["question_id"])
  end

  def initialize(options = {}) #title, body, author_id, question_id)
    @title, @body = options[:title], options[:body]
    @question_id = options[:question_id]
    @author_id = options[:author_id]
  end

end
