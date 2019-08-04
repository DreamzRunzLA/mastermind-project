require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(codeInstance)
        puts @secret_code.num_exact_matches(codeInstance)
        puts @secret_code.num_near_matches(codeInstance)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        input = gets.chomp
        instance = Code.from_string(input)
        self.print_matches(instance)
        return @secret_code == instance
    end
end
