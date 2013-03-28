require 'singleton'
require 'sqlite3'
require_relative 'aa_questions'

class Question


  def self.get_all_question
    query = "SELECT * FROM questions"
    result = AA_QuestionsDatabase.instance.execute(query)
  end

  def self.get_by_question_id(question_id)
    query = "SELECT * FROM questions WHERE question_id = #{question_id}"
    result = AA_QuestionsDatabase.instance.execute(query)
    result.empty? ? nil : parse(result[0])
  end

  def self.parse(result)
    question = Question.new(result[title], result[body], result["author_id"])
    question.question_id = result["question_id"]
    question
  end

  def initialize(title, body, author_id)
    @title, @body = title, body
    @question_id = nil
    @author_id = author_id
  end

end
