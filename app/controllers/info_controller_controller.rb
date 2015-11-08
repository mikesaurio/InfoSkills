class InfoControllerController < ApplicationController
before_action :get_json

	def index
	  
	end

	private
	def get_json
    delete_all_data
	    source = "lib/inputs/data.json"
    	file_read = File.read(source)
    	ActiveSupport::JSON.decode(file_read).each do |value|
    		unless value[1]['profile']['current_companies'].nil?
    			value[1]['profile']['current_companies'].each_with_index do |bissnes,index|
            a = Company.create(key: value[0], 
              company: value[1]['profile']['current_companies'][index]['company'],
              title: value[1]['profile']['current_companies'][index]['title'],
              end_date: value[1]['profile']['current_companies'][index]['end_date'])
            if a.save
              puts "."
            end
    			end

          value[1]['profile']['past_companies'].each_with_index do |bissnes,index|
            puts value[0]
            a= Company.create(key: value[0], 
              company: value[1]['profile']['past_companies'][index]['company'],
              title: value[1]['profile']['past_companies'][index]['title'],
              end_date: value[1]['profile']['past_companies'][index]['end_date'])
            if a.save
              puts "."
            end
          end
    			
    			value[1]['profile']['education'].each_with_index do |education,index|
            puts value[0]
            a=  Education.create(key: value[0], 
              degree: value[1]['profile']['education'][index]['degree'],
              end_date: value[1]['profile']['education'][index]['end_date'])
            if a.save
              puts "."
            end
    			end

    			value[1]['profile']['skills'].each_with_index do |skills,index|
            puts value[0]
            a = Skill.create(key: value[0], 
              name: value[1]['profile']['skills'][index])
            if a.save
              puts "."
            end
    			end
    		end
    			#raise	value
    	end
    end

    def delete_all_data
      Company.delete_all
      Education.delete_all
      Skill.delete_all
    end
end
