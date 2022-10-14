 require 'pry-byebug'

$ENGLISH_ALPHABET_LENGTH = 26
$MAX_CODEPOINT_VALUE = 90
$MIN_CODEPOINT_VALUE = 65

def input_string
    puts 'Enter String for encryption by caeser cipher'
    gets.chomp
end


def input_shift_factor
    puts 'Enter shift value, be sensible!'
    gets.chomp.to_i
end

def get_codepoints_of_uppercase_alphabets(string)
    codepoints = string.upcase.codepoints
end

def get_rotated_codepoints_of_uppercase_alphabets(codepoints, shift_factor)
    # binding.pry

    # p codepoints

    codepoints.each_index do |index|
        if(codepoints[index] >= $MIN_CODEPOINT_VALUE && codepoints[index] <= $MAX_CODEPOINT_VALUE )
            codepoints[index] = rotate(codepoints[index], shift_factor)
        end
    end 
    codepoints
end

def rotate(codepoint, shift_factor)
    modulo_rotational_value = (shift_factor.abs) % $ENGLISH_ALPHABET_LENGTH
    offset = shift_factor > 0 ? forward_or_backward_shift_offset(codepoint, modulo_rotational_value) : (forward_or_backward_shift_offset(codepoint, $ENGLISH_ALPHABET_LENGTH-modulo_rotational_value))
    codepoint + offset
end

def forward_or_backward_shift_offset(codepoint, modulo_rotational_value)
    max_forward_shift = $MAX_CODEPOINT_VALUE - codepoint
    modulo_rotational_value > max_forward_shift ? modulo_rotational_value - $ENGLISH_ALPHABET_LENGTH : modulo_rotational_value
end

def make_up_for_lowercase_chars(codepoints, string)
    pattern = /[a-z]/
    codepoints.each_index do |index|
        if(pattern.match?(string[index].chr) == true)
            codepoints[index] = codepoints[index] + 32
        end
        # p codepoints[index].chr
    end
end

def print_codepoints(codepoints)
    codepoints.each{|codepoint| print codepoint.chr}
end

def main
    string = input_string
    shift_factor = input_shift_factor
    p shift_factor.class
    codepoints = get_codepoints_of_uppercase_alphabets(string)
    codepoints = get_rotated_codepoints_of_uppercase_alphabets(codepoints, shift_factor)
    codepoints = make_up_for_lowercase_chars(codepoints, string)
    print_codepoints(codepoints)
end

main