class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :comments
  has_many :votes

  def has_voted?(question)
    question.choices.each do |choice|
      choice.votes.each do |vote|
        if vote.user == self
          return true
        end
      end
    end
    false
  end

end
