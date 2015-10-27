require 'rails_helper'

describe "the sign up process" do
  it "signs a user up" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "brian@brian.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    expect(page).to have_content "You have signed up successfully."
  end

  it "logs a user in" do
    User.create(email: "brian@brian.com", password: "password", password_confirmation: "password")
    visit root_path
    click_link "Login"
    fill_in "Email", with: "brian@brian.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end

describe 'the add a question process' do
  it "add a question", js: true do
    user = User.create(email: "brian@brian.com", password: "password", password_confirmation: "password")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    visit root_path
    click_link "New Question"
    fill_in "Choice 1", with: "Brian"
    fill_in "Choice 2", with: "Kyle"
    click_on "Create Question"
    expect(page).to have_content "Brian"
    expect(page).to have_content "OR"
  end
end

describe 'the edit a question process' do
  it "edit a question", js: true do
    user = User.create(email: "brian@brian.com", password: "password", password_confirmation: "password")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    question = Question.create(user_id: user.id, title: "")
    Choice.create(question_id: question.id, content: "boo")
    Choice.create(question_id: question.id, content: "hoo")
    visit root_path
    click_link "Edit"
    fill_in "Choice 1", with: "Brian"
    fill_in "Choice 2", with: "Kyle"
    click_on "Update Question"
    expect(page).to have_content "Brian"
    expect(page).to have_content "OR"
  end
end

describe 'the destroy a question process' do
  it "destroy a question", js: true do
    user = User.create(email: "brian@brian.com", password: "password", password_confirmation: "password")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    question = Question.create(user_id: user.id, title: "")
    Choice.create(question_id: question.id, content: "boo")
    Choice.create(question_id: question.id, content: "hoo")
    visit root_path
    click_link "Destroy"
    expect(page).to have_no_content "boo"
  end
end

describe 'the add a comment process' do
  it "add a comment", js: true do
    user = User.create(email: "brian@brian.com", password: "password", password_confirmation: "password")
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user).unshift("User"))
    question = Question.create(user_id: user.id, title: "")
    Choice.create(question_id: question.id, content: "boo")
    Choice.create(question_id: question.id, content: "hoo")
    visit root_path
    click_link "boo"
    click_link "Show Comments"
    fill_in "Add a Comment", with: "hello"
    click_on "Create Comment"
    expect(page).to have_content "hello"
  end
end
