class Question < ActiveRecord::Base
  has_many :choices
  has_many :comments

  accepts_nested_attributes_for :choices, allow_destroy: true
end
