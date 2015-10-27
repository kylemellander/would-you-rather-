class Question < ActiveRecord::Base
  has_many :choices
  has_many :comments
  belongs_to :user

  accepts_nested_attributes_for :choices, allow_destroy: true

  def percent
    if choices[0].votes.length == 0 && choices[1].votes.length == 0
      false
    else
      100*choices[0].votes.length / (choices[0].votes.length + choices[1].votes.length)
    end
  end
end
