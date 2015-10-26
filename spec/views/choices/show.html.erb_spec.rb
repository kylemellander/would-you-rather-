require 'rails_helper'

RSpec.describe "choices/show", type: :view do
  before(:each) do
    @choice = assign(:choice, Choice.create!(
      :question => nil,
      :content => "Content",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Img/)
  end
end
