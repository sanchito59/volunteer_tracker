class Project
    attr_accessor :title, :id

    def initialize(attributes)
        @title = attributes.fetch(:title)
        @id = attributes.fetch(:id)
    end

    def self.all
        returned_projects = DB.exec("SELECT * FROM projects;")
        projects = []
        returned_projects.each() do |project|
          title = project.fetch("title")
          id = project.fetch("id").to_i
          projects.push(Project.new({:title => title, :id => id}))
        end
        projects
    end

    def self.sort()
        projects = Project.all
        projects.sort { |a, b| a.title <=> b.title }
    end

    def ==(project_to_compare)
        if project_to_compare != nil
            self.title() == project_to_compare.title()
        else
            false
        end
    end

    def save
        result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
        @id = result.first().fetch("id").to_i      
    end

    def self.find(id)
        project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
        if project
            title = project.fetch("title")
            id = project.fetch("id").to_i
            Project.new({ :title => title, :id => id })
        else
            nil
        end        
    end

    def self.search(search_term)
        projects = Project.all
        # had some issues on a personal project of mine installing gems and having SSL issues, in the process I uninstalled the culprit gems, launched this again to confirm I didn't break it, and saw that 'match?' was now undefined, this works altered, but may need to be changed to 'match?' to work again
        projects.select {|e| /#{search_term}/i.match e.title}
    end

    def volunteers
        Volunteer.find_by_project(self.id)
    end

    def update(title)
        @title = title
        DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{id}")   
    end

    def delete
        DB.exec("DELETE FROM projects WHERE id = #{@id};")
        DB.exec("DELETE FROM volunteers WHERE project_id = #{@id};")     
    end
end