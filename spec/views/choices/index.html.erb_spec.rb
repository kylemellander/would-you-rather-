require 'rails_helper'

RSpec.describe "choices/index", type: :view do
  before(:each) do
    assign(:choices, [
      Choice.create!(
        :question => nil,
        :content => "Content",
        :img => "Img"
      ),
      Choice.create!(
        :question => nil,
        :content => "Content",
        :img => "Img"
      )
    ])
  end

  it "renders a list of choices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
