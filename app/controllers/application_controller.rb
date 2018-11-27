require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :index
    end

    post '/teams' do

      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      binding.pry

      #iterates over the heroes hash
      params[:team][:heroes][0].each_with_index do |member, index|
        hero = Hero.new
        index += 1
        # binding.pry
        member.name = hero_data["member#{index}".to_sym]["member#{index}_name".to_sym]
        member.power = hero_data["member#{index}".to_sym]["member#{index}_power".to_sym]
        member.bio = hero_data["member#{index}".to_sym]["member#{index}_bio".to_sym]
        @team.heroes << member
        # binding.pry
        # binding.pry
        # binding.pry
      end
      @team
        # binding.pry
      erb :show
    end

    # get '/teams' do
    #   erb :show
    # end

end
