# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program


#one line solution
# def find(id)
#   @candidates.select { |candidate| return candidate if candidate[:id] == id}
# end
def find(id)
  @candidates.select do |candidate|
    if candidate[:id] == id
      candidate
    else
      nil
    end
  end
end

def experienced?(candidate)
 exp = candidate[:years_of_experience] 
 exp >= 2 ? true : false
end

def github_pts?(candidate)
  candidate[:github_points] >= 100
end

def language?(candidate)
  candidate[:languages].include?('Ruby' || 'Python' )
end

def date_applied?(candidate)
  date_applied = candidate[:date_applied] 
  (date_applied..date_applied+15).cover?(Date.today)
end

def age?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates
  @candidates.select do |candidate|
    if experienced?(candidate) == true &&
    github_pts?(candidate) == true 
    age?(candidate) == true 
    date_applied?(candidate) == false 
    language?(candidate) == true
      qualified = candidate
      qualified
    end
  end
end

def ordered_by_qualifications
  @candidates.sort! do |x, y|
    result = x[:years_of_experience] <=> y[:years_of_experience]
    if result == 0
      result = x[:github_points] <=> y[:github_points]
    end
    -1 * result
  end
  # @candidates.map {|c| c[:id]}
end











# More methods will go below
#puts experienced?(@candidates[0])

