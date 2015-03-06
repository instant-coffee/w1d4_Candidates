require 'active_support/all'

def candidates 
  running = true
  while running do 

    puts "what do you need?"
    need = gets.chomp
      
      case need
      when 'find 1'
        puts find(1)
      when 'all'
        puts @candidates
      when 'qualified'
        puts qualified_candidates
      when 'quit'
        return
      else
        puts 'say again?'
      end
  end
end 