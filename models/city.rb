class City
  attr_accessor :id, :city_name, :country_name, :currency, :currency_code

  def self.open_connection
    conn = PG.connect(dbname: "sinatraweekend")
  end

end
