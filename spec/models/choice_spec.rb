require 'rails_helper'

describe Choice do
  it {should belong_to :question}
  it {should have_many :votes}
end
