require 'spec_helper'

feature "User creates a new question" do

  before(:each) do
    # eventually a factory girl user will log in
    visit new_question_path
  end

  let(:question) { create(:question) }


  context "that is invalid" do 
    scenario "when content is missing" do
      fill_in "question title", { with: '' }
      fill_in "question content", { with: question.content } 
      click_on "Create Question"
      expect(page).to have_content("Error!")
    end

    scenario "when title is missing" do
      fill_in "question title", { with: question.title }
      fill_in "question content", { with: '' } 
      click_on "Create Question"
      expect(page).to have_content("Error!")
    end
  end

  context "that is valid" do
    scenario "when content and title are included" do 
      fill_in "question title", { with: question.title }
      fill_in "question content", { with: question.content } 
      click_on "Create Question"
      expect(page).to have_content(question.title)
    end
  end
end

  # Given I haven't logged in
  # When I visit the index I want to review questions
  # Then review comments to the selected question
  # Then review answers to the selected question
  # Then review comments to the selected answers
  
  # User Index Test
  # Given I am logged in
  # When I visit the index I want to review questions
  # Then review comments to the selected question
  # Then review answers to the selected question
  # Then review comments to the selected answers

    