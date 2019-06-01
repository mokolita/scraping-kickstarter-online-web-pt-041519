require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstater.html')
  
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}
  kickstarter.css("li.project.grid_4").each do |project|
    
    projects[project] = {}
    projects 
  title: project.css("h2.bbcard_name strong a").text
  image link: project.css("div.project-thumbnail a img").attribute("src").value
  description: project.css("p.bbcard_blurb").text
  location: project.css("li.data-location.location-name").text
  percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
  binding.pry 
end