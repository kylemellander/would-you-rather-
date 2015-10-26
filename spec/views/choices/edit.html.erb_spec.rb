require 'rails_helper'

RSpec.describe "choices/edit", type: :view do
  before(:each) do
    @choice = assign(:choice, Choice.create!(
      :question => nil,
      :content => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit choice form" do
    render

    assert_select "form[action=?][method=?]", choice_path(@choice), "post" do

      assert_select "input#choice_question_id[name=?]", "choice[question_id]"

      assert_select "input#choice_content[name=?]", "choice[content]"

      assert_select "input#choice_img[name=?]", "choice[img]"
    end
  end
end
