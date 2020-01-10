require "capybara/rspec"
require "./volunteery"
require 'sinatra'
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# Your project should be set up so that a volunteer can only be created if a project already exists. (This makes it easier to assign the one to many relationship in Sinatra.) Focus on getting one integration spec passing at a time.

# The user should be able to visit the home page and fill out a form to add a new project. When that project is created, the application should direct them back to the homepage.

describe 'the homepage', {:type => :feature} do
  it 'takes the user to the homepage where they can see a list of projects or be prompted to create one' do
    visit '/'
    expect(page).to have_content('Volunteery')
    expect(page).to have_content('Current Projects')
    click_on("Let's set one up!")
    expect(page).to have_content('Create a project today!')
  end
end

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the New Project Page where they can create a project' do
    visit '/projects/new'
    expect(page).to have_content('Create a project today!')
    fill_in('project_title', :with => 'Teaching Kids to Code')
    click_button('Create Project')
    expect(page).to have_content('Teaching Kids to Code')
  end
end

# If the user goes to a non-existent page ID there is an error page that will prompt them to create a project or return home.

describe 'the non-existent project page', {:type => :feature} do
  it 'prompts a user to create a project or return home' do
    visit '/projects/non_existent_numeric_id'
    expect(page).to have_content("Uh oh, that project doesn't seem to exist, would you like to create it?")
    fill_in('project_title', :with => 'Build Your First Platformer Video Game')
    click_button('Create Project')
    expect(page).to have_content('Build Your First Platformer Video Game')
  end
end

# # A user should be able to click on a project to see its detail. The detail page includes a form where the project can be updated. When the form is submitted, the user can be directed to either the home page or that project's detail page. (The test will work for either.)

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Teaching Jr. Developers Database Design', :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    expect(page).to have_content('Teaching Jr. Developers Database Design')
    fill_in('project_title', :with => 'Teaching Sr. Developers New Trends in Database Design')
    click_button('Update')
    expect(page).to have_content('Teaching Sr. Developers New Trends in Database Design')
  end
end

# # A user should be able to nagivate to a project's detail page and delete the project. The user will then be directed to the index page. The project should no longer be on the list of projects.

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Teaching Jr. Developers Database Design', :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    expect(page).to have_content('Teaching Jr. Developers Database Design')
    click_button('Delete')
    expect(page).to have_content('There are currently no projects.')
  end
end

# # The user should be able to click on a project detail page and see a list of all volunteers working on that project. The user should be able to fill in the form with a volunteer, click 'Add volunteer', and see the volunteer added.

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page and adds another volunteer' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Jasmine', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    fill_in('name', :with => 'Jane')
    click_button('Add Volunteer')
    expect(page).to have_content('Jane')
    expect(page).to have_content('Jasmine')
  end
end
