require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    post '/teams' do

      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])

      #iterates over the params hash (member1, member2, member3)
      params[:team][:heroes].each do |member|

        hero = Hero.new

        hero.name = member["name"]
        hero.power = member["power"]
        hero.bio = member["bio"]

        @team.heroes << hero

      end

      erb :show
    end

end
