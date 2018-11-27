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
        binding.pry
        hero = Hero.new
        index = 1
        hero.name = member["member#{index}"]["member#{index}_name"]
        # puts member["member#{index}"]["member#{index}_name"]
        hero.power = member["member#{index}"]["member#{index}_power"]
        # puts member["member#{index}"]["member#{index}_power"]
        hero.bio = member["member#{index}"]["member#{index}_bio"]
        # puts member["member#{index}"]["member#{index}_bio"]
        @team.heroes << hero
        index += 1

      end

      erb :show
    end

    # get '/teams' do
    #   erb :show
    # end

end
