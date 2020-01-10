class Volunteer
    attr_accessor :name, :project_id, :id

    def initialize(attributes)
        @name = attributes.fetch(:name)
        @project_id = attributes.fetch(:project_id)
        @id = attributes.fetch(:id)
    end

    def ==(project_to_compare)
        if project_to_compare != nil
            (self.name() == project_to_compare.name()) && (self.project_id() == project_to_compare.project_id())
        else
          false
        end
    end

    def self.all
        returned_volunteers = DB.exec("SELECT * FROM volunteers;")
        volunteers = []
        returned_volunteers.each() do |volunteer|
            name = volunteer.fetch("name")
            project_id = volunteer.fetch("project_id").to_i
            id = volunteer.fetch("id").to_i
            volunteers.push(volunteer.new({:name => name, :project_id => project_id, :id => id}))
        end
        volunteers
    end

end