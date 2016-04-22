class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.to_csv
    attributes = %w{id email nombre apellido}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << [user.id, user.email, user.first_name, user.last_name]
      end
    end
  end
end
