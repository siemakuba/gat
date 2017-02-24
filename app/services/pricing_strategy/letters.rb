module PricingStrategy
  class Letters < Base
    COUNTABLE_LETTER = 'a'
    QUANTIFIER = 100

    private

    def calculate_factor
      Rational(letters_quantity, QUANTIFIER)
    end

    def letters_quantity
      data.count COUNTABLE_LETTER
    end
  end
end
