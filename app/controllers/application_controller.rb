require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    post '/teams' do

      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      binding.pry

      #iterates over the params hash (member1, member2, member3)
      params[:team][:heroes][0].each_with_index do |hero_data, index|
        hero = Hero.new
        index += 1

        hero.name = hero_data["member#{index}".to_sym]["member#{index}_name".to_sym]
        hero.power = hero_data["member#{index}".to_sym]["member#{index}_power".to_sym]
        hero.bio = hero_data["member#{index}".to_sym]["member#{index}_bio".to_sym]
        @team.heroes << hero

      end
      @team

      erb :show
    end

    # get '/teams' do
    #   erb :show
    # end

end
