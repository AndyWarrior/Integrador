class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  def self.to_csv
    attributes = %w{id email nombre apellido programa 
      proyecto calle colonia ciudad estado c.p. telefono 
      habitantes cuartos paredes techo piso albañil 
      tienda_cercana}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << [user.id, user.email, user.first_name, 
          user.last_name, Program.find(user.program).name, 
          Project.find(user.project).name, user.street, 
          user.neighborhood, user.city, user.state, 
          user.zip_code, user.telephone, user.people_living, 
          user.rooms, user.wall_material, user.roof_material, 
          user.floor_material, user.build_yourself, user.store]
      end
    end
  end

end
