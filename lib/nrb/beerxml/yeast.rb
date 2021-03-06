require 'nrb/beerxml/record_validators/boolean_validator'  # hack so "validates boolean:" magic works
require 'nrb/beerxml/record_validators/percentage_validator'  # hack so "validates percentage:" magic works
module NRB; module BeerXML
  class Yeast < Record

    attr_accessor :add_to_secondary # boolean
    attr_accessor :amount           # float required
    attr_accessor :amount_is_weight # boolean
    attr_accessor :attenuation      # percentage
    attr_accessor :best_for         # string
    attr_accessor :flocculation     # list
    attr_accessor :form             # list required
    attr_accessor :laboratory       # string
    attr_accessor :max_reuse        # integer
    attr_accessor :max_temperature  # temperature
    attr_accessor :min_temperature  # temperature
    attr_accessor :notes            # string
    attr_accessor :product_id       # string
    attr_accessor :times_cultured   # integer
    attr_accessor :type             # list required

    validates :add_to_secondary, boolean: { allow_nil: true }
    validates :amount, presence: { greater_than_or_equal_to: 0 }
    validates :amount_is_weight, boolean: { allow_nil: true }
    validates :attenuation, percentage: { allow_nil: true }
    validates :flocculation, inclusion: { allow_nil: true, in: ["High", "Low", "Medium", "Very High" ] }
    validates :form, presence: true, inclusion: { in: %w( Culture Dry Liquid Slant ) }
    validates :max_reuse, numericality: { allow_nil: true, greater_than_or_equal_to: 0, only_integer: true }
    validates :max_temperature, numericality: { allow_nil: true }
    validates :min_temperature, numericality: { allow_nil: true }
    validates :times_cultured, numericality: { allow_nil: true, greater_than_or_equal_to: 0, only_integer: true }
    validates :type, presence: true, inclusion: { in: %w(Ale Champagne Lager Wheat Wine) }


  end
end; end
