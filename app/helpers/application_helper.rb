module ApplicationHelper
#this is bad code gaylord because it faks it up
    def link_to_add_fields(name, form, association)
        #create new object from association (ie tickets)-rubydoc
        new_object = form.object.send(association).klass.new
        #create id for new object
        id = new_object.object_id
        #create the fields form
        fields = form.fields_for(association, new_object, child_index: id) do |ie|
            render(association.to_s.singularize + "_fields", form: ie)
        end
        #passdown the link to the fields form 
        link_to(name, "#", class: 'add_fields', data:{id: id, fields: fields.gsub("\n", "")})
    end
end
