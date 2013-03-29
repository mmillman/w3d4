require 'sqlite3'
require_relative 'aa_questions'

class Reply
  attr_accessor :id, :question_id, :parent_id, :body

  def self.find_all
    query = "SELECT * FROM replies"
    result = QuestionsDatabase.instance.execute(query)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM replies WHERE id = ?"
    row_hash_result = QuestionsDatabase.instance.execute(query, id)
    row_hash_result.empty? ? nil : parse(row_hash_result[0])
  end

  def self.parse(row_hash)
    reply = Reply.new(id: row_hash["id"],
                      question_id: row_hash["question_id"],
                      parent_id: row_hash["parent_id"],
                      body: row_hash["body"])
  end

  def initialize(options = {}) #title, body, author_id, question_id)
    @id, @question_id = options[:id], options[:question_id]
    @parent_id = options[:parent_id]
    @body = options[:body]
  end

  def self.most_replied
    query = <<-SQL
        SELECT a.*
          FROM replies a
          JOIN replies b ON (a.id = b.parent_id)
      GROUP BY a.id
      ORDER BY COUNT(*) DESC
      LIMIT 1
    SQL
    result = QuestionsDatabase.instance.execute(query)[0]
    Reply.parse(result)
  end


  def replies


  end

end
