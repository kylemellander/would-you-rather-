'rails_helper'

describe User do
  it {should have_many :questions}
  it {should have_many :votes}
  it {should have_many :comments}
  it "check if voted" do
    user = User.create(id: 1, email: "hi@hi.com", password: "password", password_confirmation: "password")
    user2 = User.create(id: 2, email: "brain@brain.com", password: "password", password_confirmation: "password")
    question = Question.create(user_id: user.id)
    choice = Choice.create(question_id: question.id, content: "blah")
    vote = Vote.create(choice_id: choice.id, user_id: user.id)
    expect(user.has_voted?(question)).to eq true
    expect(user2.has_voted?(question)).to eq false
  end

end
