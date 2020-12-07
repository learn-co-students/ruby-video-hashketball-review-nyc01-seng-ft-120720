# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(player_name)
  search_player_data(player_name,:points)
end

def shoe_size (player_name)
  search_player_data(player_name,:shoe)
end

def team_colors (player_name)
  search_team_data(player_name, :colors)
end
  
def team_names
  team_names_list = []
  game_hash.each_key do |location|
    team_names_list << game_hash[location][:team_name]
  end
  team_names_list
end

def player_numbers (team_name)
  player_numbers = []
  roster = []
  
  player_data_aoh = search_team_data(team_name, :players)
  player_data_aoh.each do |player|
    player_numbers << player[:number]
  end
  player_numbers
end

def player_stats (player_name)
  team_names_array = team_names
  player_stats_hash = {}
  
  team_names_array.each do |team|
    roster = search_team_data(team,:players)
    roster.each do |player_entry|
      if player_entry[:player_name] == player_name
        player_stats_hash = player_entry
        return player_stats_hash
      end
    end
  end
end

def big_shoe_rebounds
  stat_by_player = collect_stat_by_name(:shoe)
  player_with_max_stat = find_max_stat_by_player(stat_by_player)
  num_rebounds = search_player_data(player_with_max_stat,:rebounds)
  num_rebounds
end

#
#Below are helper methods
#

def collect_stat_by_name (stat) #returns hash of "name" => stat value
  team_names_array = team_names
  player_stats_array = []
  roster = []
  player_stat = {}
  
  team_names_array.each do |team|
    roster << search_team_data(team, :players)
    roster.flatten!
    roster.each do |player_entry|
      player_stats_array << player_entry.slice(:player_name, stat)
    end
  end
    player_stats_array.each do |player_stat_hash|
      player_stat[player_stat_hash[:player_name]] = player_stat_hash[stat]
    end
  player_stat
end

def find_max_stat_by_player(stat_by_player)
 sorted_stat_array = stat_by_player.sort_by { |name, stat| stat}
 player_with_max_stat = sorted_stat_array.last[0]
end
  

def search_team_data (team_name, desired_team_data)
  game_hash.each do |location, attribute|
    if game_hash[location][:team_name] == team_name
      returned_team_data = game_hash[location][desired_team_data]
      return returned_team_data
    end
  end
end

def search_player_data (player_name, desired_player_data)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.class == Array
        index=0
        while data[index].class == Hash
          i = 0
          while i < data.length do 
            if data[i][:player_name]==player_name
              returned_player_data = data[i][desired_player_data]
              return returned_player_data
              # binding.pry
            end
            i += 1 
          end
          index += 1
        end 
      end
    end
  end
end
  
#
# Below are bonus methods
#

def most_points_scored
  stat_by_player = collect_stat_by_name(:points)
  player_with_max_stat = find_max_stat_by_player(stat_by_player)
  player_with_max_stat
end

def winning_team
  team_array = team_names
  team_points = [0,0]
  
  i = 0
  while i < team_array.length do
    player_data = search_team_data(team_array[i],:players)
    
    player_data.each do |single_player|
      points = single_player[:points]
      team_points[i] += points
    end
    i += 1
  end
  team_array[team_points.index((team_points.max))] + " is the winner!"
end

def player_with_longest_name
  stat_by_player = collect_stat_by_name(:player_name)
  name_length_values = stat_by_player.each_with_object ({}) { |(k,v),hash| hash[k] = v.length}
  longest_name = find_max_stat_by_player(name_length_values)
  longest_name
end

def long_name_steals_a_ton?
  stat_by_player = collect_stat_by_name(:steals)
  player_with_max_stat = find_max_stat_by_player(stat_by_player)
  long_name = player_with_longest_name
  if player_with_max_stat == player_with_longest_name
    result = true 
  else
    result = false
  end
  result
end 