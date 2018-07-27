require 'pry'

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
                },
                "Reggie Evans" => {
                    :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
                },
                "Brook Lopez" => {
                    :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
                },
                "Mason Plumlee" => {
                    :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
                },
                "Jason Terry" => {
                    :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
                }
            }
        },
        
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number => 4, :shoe => 18, :points => 10, :rebounds =>1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
                },
                "Bismak Biyombo" => {
                    :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
                },
                "Brendan Haywood" => {
                    :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
                }
            }
        }
    }
end

def num_points_scored(name)
    game_hash.each do |location, basic|
        basic[:players].find do |player, stats|
            if player == name
                stats.each do |things, moreinfo|
                    if things == :points
                      return moreinfo
                    end
                end
            end
        end
    end
end

def shoe_size(name)
    game_hash.each do |location, basic|
        basic[:players].each do |player, stats|
            if player == name
                stats.each do |things, moreinfo|
                    if things == :shoe
                        return moreinfo
                    end
                end
            end
        end
    end
end

def team_colors(team)
    game_hash.each do |location, basic|
        if basic[:team_name] == team
            return game_hash[location][:colors]
        end
    end
end

def team_names
arr = []
game_hash.each do |location, basic|
#    binding.pry
    basic.map do |info, specifics|
    arr << specifics if info == :team_name
    end
    end
arr
end

def player_numbers(team)
    team_numbers = []
    game_hash.each do |location, basic|
        if basic[:team_name] == team
#            binding.pry
            basic[:players].each do |info, specifics|
                specifics.each do  |stats, nums|
                    team_numbers << nums if stats == :number
                end
            end
        end
    end
 team_numbers
end

def player_stats(player)
     game_hash.each do |location, basic|
         basic[:players].each do |name, stats|
             if name == player
                 return stats
             end
          end
        end
     end

def biggest_shoe
    arr = []
    game_hash.each do |location, basic|
        basic[:players].each do |name, stats|
#            binding.pry
            arr << stats[:shoe]
            end
        end

    return arr.sort[-1]
    end

def big_shoe_rebounds
     game_hash.each do |location, basic|
         basic[:players].each do |name, stats|
             if stats[:shoe] == biggest_shoe
                 return stats[:rebounds]
             end
        end
    end
end

def most_points_scored
  points_arr = []
  game_hash.each do |locaiton, basic|
    basic[:players].each do |name, stats|
      stats.each do |info, specifics|
        if info == :points
          points_arr << specifics
        end
      end
    end
  end
  points_arr.sort!
  
  game_hash.each do |locaiton, basic|
    basic[:players].each do |name, stats|
      stats.each do |info, specifics|
        if specifics == points_arr[-1]
          return name 
        end
      end
    end
  end
end

def winning_team
  home = 0
  away = 0
  game_hash.each do |location, basic|
    if location == :home
      basic[:players].each do |name, info|
        info.each do |stats, specifics|
          if stats == :points
            home += specifics
          end
        end
      end
    else 
      basic[:players].each do |name, info|
        info.each do |stats, specifics|
          if info == :points
          away += specifics
          end
        end
      end
    end
  end
    if away > home
      return game_hash[:away][:team_name]
    elsif home > away 
      return game_hash[:home][:team_name]
    end
end

def player_with_longest_name
  name_array = []
  game_hash.each do |location, basic|
    basic[:players].each do |name, info|
      name_array << name 
    end
  end
  
  name_array.sort_by! {|name| name.length}
  return name_array[-1]
  
end
    
def long_name_steals_a_ton? 
  new_hash = {}
  game_hash.each do |location, basic|
    basic[:players].each do |name, info|
      info.each do |k, v|
        new_hash[name] = v
      end
    end
  end
new_hash.sort_by {|k, v| k.length}.to_a
# new_arr = new_hash.to_a

new_hash[-1][0] == player_with_longest_name
end





