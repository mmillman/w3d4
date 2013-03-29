require 'sqlite3'
require_relative 'aa_questions'

class QuestionFollower
  attr_accessor :id, :question_id, :follower_id

  def self.find_all
    query = "SELECT * FROM question_followers"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM question_followers WHERE id = #{id}"
    row_hash_result = QuestionsDatabase.instance.execute(query)
    row_hash_result.empty? ? nil : parse(row_hash_result[0])
  end

  def initialize(options = {})
    @id = options[:id]
    @question_id, @follower_id = options[:question_id], options[:follower_id]
  end

  def self.parse(row_hash)
    question_follower = QuestionFollower.new(id: row_hash["id"],
                            question_id: row_hash["question_id"],
                            follower_id: row_hash["user_id"])
  end



end
