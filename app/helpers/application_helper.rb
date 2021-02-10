module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        capture do
            link_to({sort: column, direction: direction}) do
              concat title
              concat " "
              concat arrow(column)
            end
        end
    end
end
        
def arrow(column)
    return '' if params[:sort] != column
    arrow = params[:direction] == 'asc' ? 'down' : 'up'
        "<i class='fa fa-arrow-#{arrow}'></i>".html_safe
end
