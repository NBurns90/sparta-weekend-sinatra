class City
  attr_accessor :city_id, :city_name, :country_name, :currency, :currency_code

  # SQL save function
  def save
      conn = City.open_connection

      if(!self.city_id)
        # Insert a new record in to the database
        sql = "INSERT INTO city_data (city_name, country_name, currency, currency_code) VALUES ('#{self.city_name}', '#{self.country_name}', '#{self.currency}', '#{self.currency_code}')"
      else
        # Update an existing one
        sql = "UPDATE city_data SET city_name='#{self.city_name}', country_name='#{self.country_name}', currency='#{self.currency}', currency_code='#{self.currency_code}' WHERE city_id = #{self.city_id}"
      end

      conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect(dbname: "sinatraweekend")
  end

  def self.all
    conn = self.open_connection

    sql = "SELECT * FROM city_data ORDER BY city_id"

    results = conn.exec(sql)

    cities = results.map do |tuple|
      self.hydrate tuple
    end

    cities
  end

  def self.find city_id
    conn = self.open_connection

    sql = "SELECT * FROM city_data WHERE city_id = #{city_id} LIMIT 1"

    results = conn.exec(sql)

    city = self.hydrate(results[0])

    city
  end

  def self.destroy city_id
      conn = self.open_connection

      sql = "DELETE FROM city_data WHERE city_id = #{city_id}"

      conn.exec(sql)
  end

  # hydrate function
  def self.hydrate city_data
    city = City.new

    city.city_id = city_data['city_id']
    city.city_name = city_data['city_name']
    city.country_name = city_data['country_name']
    city.currency = city_data['currency']
    city.currency_code = city_data['currency_code']

    city
  end

end
