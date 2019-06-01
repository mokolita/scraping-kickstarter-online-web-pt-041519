require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstater.html')
  
  kickstarter = Nokogiri::HTML(html)
  
  projects: kickstarter.css("li.project.grid_4")
  title: project.css("h2.bbcard_name strong a").text
  image link: project.css("div.project-thumbnail a img").attribute("src").value
  description: project.css("p.bbcard_blurb").text
  location: project.css(li.a data-location.span location-name).text
  binding.pry 
end