require_relative 'Card'

ALPHAPETS = ("A".."Z").to_a
class Board
    attr_accessor :grid, :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size, nil) }
    end

    def populate
        ((size**2)/2).times do
            card = rand_card
            pos1 = generate_pos_unless_not_empty
            assign_rand_card_to_positions(pos1, card)
            pos2 = generate_pos_unless_not_empty
            assign_rand_card_to_positions(pos2, card)
        end
    end
    
    def assign_rand_card_to_positions(pos, card)
        self[pos] = card
    end

    def generate_pos
        pos = rand(size), rand(size)
    end

    def rand_card
        card_val = ALPHAPETS.sample
        Card.new(card_val)
    end

    def empty_pos?(pos)
        self[pos].nil?
    end

    def generate_pos_unless_not_empty
        pos = generate_pos
        while not empty_pos?(pos)
            pos = generate_pos
        end
        pos
    end

    def render
        
    end

    def won?
        
    end

    def reveal
        
    end

    def [](pos)
        row, col = pos[0], pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos[0], pos[1]
        @grid[row][col] = value
    end
end