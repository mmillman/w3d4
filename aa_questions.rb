require 'singleton'
require 'sqlite3'

class AA_QuestionsDatabase < SQLite3::Database

  include Singleton

  def initialize
    super("aa_questions.db")
    self.results_as_hash = true
    self.type_translation = true
  end

end

# def get_users
#   User.instance.execute("SELECT * FROM users")
# end