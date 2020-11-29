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

def num_points_scored(player)
  game_hash.each do |team, stats|
    stats[:players].each do |guy|
      if guy[:player_name] == player
          return guy[:points]
      end
    end
  end
end
  
def shoe_size(player)
  game_hash.each do |team, stats|
    stats[:players].each do |guy|
      if guy[:player_name] == player
        return guy[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |teams, stats|
    if stats[:team_name] == team
      return stats[:colors]
    end
  end
end

def team_names
  game_hash.map do |team, stats|
    stats[:team_name]
  end
end

def player_numbers(player)
  number = []
  game_hash.each do |team, stats|
    if stats[:team_name] == player
      stats.each do |level, value|
        if level == :players
          value.each do |guy|
            number << guy[:number] 
          end
        end
      end
    end
  end
  number 
end

def player_stats(player)
  game_hash.each do |hoa, stats|
    stats[:players].each do |guy|
      if guy[:player_name] == player
        return guy
      end
    end
  end
end
  
def big_shoe_rebounds
  shoe_size = 10 
  rebounds = 0 
  game_hash.each do |team, stats|
    stats[:players].each do |guy|
      if guy[:shoe] > shoe_size
        shoe_size = guy[:shoe]
        rebounds = guy[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0 
  player_with_points = []
  
  game_hash.each do |team, stats|
    stats[:players].each do |guy|
      if guy[:points] > most_points
        most_points = guy[:points]
        player_with_points = guy[:player_name]
      end
    end
  end
  most_points
  player_with_points
end

def winning_team
  home_points = 0 
  away_points = 0 
  
  game_hash.each do |team, stats|
    if team = :home 
      stats[:players].each do |guys|
        home_points += guys[:points]
      end
      
    else 
      stats[:players].each do |guys|
        away_points += guys[:points]
      end
    end
  end
  if home_points > away_points
    puts "The #{game_hash[:home][:team_name]} wins!"
  else
    puts "The #{game_hash[:away][:team_name]} wins!"
  end
end

def player_with_longest_name
  longest_name = 0
  player_longest_name = []
  game_hash.each do |team, stats|
    stats[:players].each do |guy|
      if guy[:player_name].length > longest_name
        longest_name = guy[:player_name].length
        player_longest_name = guy[:player_name]
      end
    end
  end
  #puts "#{player_longest_name} has the longest name. It is #{longest_name} letters long."
  player_longest_name
end

def long_name_steals_a_ton?
  player_with_longest_name
  player_with_steals = []
  most_steals = 0 
  game_hash.each do |team, stats|
    stats[:players].each do |guys|
      if guys[:steals] > most_steals
        most_steals = guys[:steals]
        player_with_steals = guys[:player_name]
      end
    end
  end
  if player_longest_name = player_with_steals
    return true 
  end
end

        
    
