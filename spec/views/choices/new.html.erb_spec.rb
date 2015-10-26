require 'rails_helper'

RSpec.describe "choices/new", type: :view do
  before(:each) do
    assign(:choice, Choice.new(
      :question => nil,
      :content => "MyString",
      :img => "MyString"
    ))
  end

  it "renders new choice form" do
    render

    assert_select "form[action=?][method=?]", choices_path, "post" do

      assert_select "input#choice_question_id[name=?]", "choice[question_id]"

      assert_select "input#choice_content[name=?]", "choice[content]"

      assert_select "input#choice_img[name=?]", "choice[img]"
    end
  end
end
