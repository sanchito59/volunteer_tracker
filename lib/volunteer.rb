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

    def update(name, project_id)
        @name = name
        @project_id = project_id
        DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
    end
    
    def delete
        DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
    end
    
    def self.clear
        DB.exec("DELETE FROM volunteers *;")
    end

    def self.all
        returned_volunteers = DB.exec("SELECT * FROM volunteers;")
        volunteers = []
        returned_volunteers.each() do |volunteer|
            name = volunteer.fetch("name")
            project_id = volunteer.fetch("project_id").to_i
            id = volunteer.fetch("id").to_i
            volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
        end
        volunteers
    end

    def save
        result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) returning id;")
        @id = result.first.fetch("id").to_i
    end

    def self.find(id)
        volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
        if volunteer
            name = volunteer.fetch("name")
            project_id = volunteer.fetch("project_id").to_i
            id = volunteer.fetch("id").to_i
            Volunteer.new({ :name => name, :project_id => project_id, :id => id })
        else
            nil
        end
    end

    def self.find_by_project(proj_id)
        volunteers = []
        returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{proj_id};")
        returned_volunteers.each() do |volunteer|
          name = volunteer.fetch("name")
          id = volunteer.fetch("id").to_i
          volunteers.push(Volunteer.new({:name => name, :project_id => proj_id, :id => id}))
        end
        volunteers
      end

      def project
        Project.find(@project_id)
      end

end