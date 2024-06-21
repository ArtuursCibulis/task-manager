require 'rails_helper'

RSpec.describe 'Task', type: :system do
  let!(:user) { create :user }

  before do
    login_as user
  end

  scenario 'user creates, updates and deletes task' do
    visit root_path

    expect(page).to_not have_content 'first task'
    expect(Task.count).to eq 0
    click_link 'Create task'

    fill_in 'Title', with: 'first task'
    fill_in 'Description', with: 'this is description'
    fill_in 'Due date', with: '21062025'
    click_button 'Submit'

    sleep 1
    expect(Task.count).to eq 1
    expect(page).to_not have_content 'in_progress'
    click_link 'Edit'
    select 'in progress', from: 'Status'
    click_button 'Submit'

    accept_confirm(wait: 1) { click_link 'Delete' }
    sleep 1
    expect(Task.count).to eq 0
  end
end
