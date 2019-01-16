# Encapsulates the concept of default stock location that OFN has, as explained
# in https://github.com/openfoodfoundation/openfoodnetwork/wiki/Spree-Upgrade%3A-Stock-locations
class DefaultStockLocation
  NAME = 'default'.freeze

  def self.create!
    country = Spree::Country.find_by_iso(ENV['DEFAULT_COUNTRY_CODE'])
    state = country.states.first
    Spree::StockLocation.create!(name: NAME, country_id: country.id, state_id: state.id)
  end

  def self.destroy_all
    Spree::StockLocation.where(name: NAME).destroy_all
  end

  def self.find_or_create
    Spree::StockLocation.find_or_create_by_name(NAME)
  end
end
