require 'sqlite3'
require_relative 'aa_questions'

class QuestionLike
  attr_accessor :id, :user_id, :question_id

  def self.find_all
    query = "SELECT * FROM question_likes"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM question_likes WHERE id = #{id}"
    row_hash_result = QuestionsDatabase.instance.execute(query)
    row_hash_result.empty? ? nil : parse(row_hash_result[0])
  end

  def self.parse(row_hash)
    question_like = QuestionLike.new(id: row_hash["id"],
                                     user_id: row_hash["user_id"],
                                     question_id: row_hash["question_id"])
  end

  def initialize(options = {})
    @id, @user_id = options[:id], options[:user_id]
    @question_id = options[:question_id]
  end

end
