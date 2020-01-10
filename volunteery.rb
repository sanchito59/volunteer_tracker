require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pry'
require 'pg'
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
    redirect to('/projects')
end

get('/projects') do
    @projects = Project.all
    erb(:projects)
end

get('/projects/new') do
    erb(:new_project)
end