module DefV
  module TitleHelper

    # This method should be used in your layout and your actions.
    # 
    # In your action:
    #   <%= title "Edit user #{@user.name}" %>
    # => <h1>Edit user Jan De Poorter</h1>
    #
    # In your layout:
    #   <head>
    #     <title><%= title :site_name => 'Foobar' %></title>
    #     ...
    # => <title>Edit user Jan De Poorter - Foobar</title>
    # 
    def title arguments, options = {}
      case arguments
      when String
        @title = arguments
        options[:class] = [options[:class], 'error'].compact.join(' ') if options[:error]
        return content_tag(:h1, [options[:header], @title, options[:trailer]].compact.join(' '), options.except(:error, :header, :trailer))
      when Hash
        sitename = arguments[:site_name]
        if @title
          return "#{strip_tags(@title)} - #{sitename}"
        else
          return "#{sitename}"
        end
      end
    end
  end
end