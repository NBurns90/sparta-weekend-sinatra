class Person
  attr_accessor :id, :avatar, :first_name, :last_name, :gender, :city_id

  # SQL save function
  def save
      conn = Person.open_connection

      if(!self.id)
        # Insert a new record in to the database
        sql = "INSERT INTO person_data (avatar, first_name, last_name, gender, city_id) VALUES ('#{self.avatar}', '#{self.first_name}', '#{self.last_name}', '#{self.gender}', '#{self.city_id}')"
      else
        # Update an existing one
        sql = "UPDATE person_data SET avatar='#{self.avatar}', first_name='#{self.first_name}', last_name='#{self.last_name}', gender='#{self.gender}', city_id='#{self.city_id}' WHERE id = #{self.id}"
      end

      conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect(dbname: "sinatraweekend")
  end

  def self.all
    conn = self.open_connection

    sql = "SELECT id, avatar, first_name FROM person_data ORDER BY id"

    results = conn.exec(sql)

    persons = results.map do |tuple|
      self.hydrate tuple
    end

    persons
  end

  def self.find id
    conn = self.open_connection

    sql = "SELECT * FROM person_data WHERE id = #{id} LIMIT 1"
    # sql = "SELECT id, avatar, first_name, last_name, gender FROM person_data WHERE id=#{id}"

    results = conn.exec(sql)

    person = self.hydrate(results[0])

    person
  end

  def self.destroy id
      conn = self.open_connection

      sql = "DELETE FROM person_data WHERE id = #{id}"

      conn.exec(sql)
  end

  # hydrate function
  def self.hydrate person_data
    person = Person.new

    person.id = person_data['id']
    person.avatar = person_data['avatar']
    person.first_name = person_data['first_name']
    person.last_name = person_data['last_name']
    person.gender = person_data['gender']
    person.city_id = person_data['city_id']

    person
  end

end
