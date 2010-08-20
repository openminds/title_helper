module Defv
  module TitleHelper
    class Railtie < Rails::Railtie
      initializer 'title_helper.action_view' do
        ActionView::Base.send(:include, DefV::TitleHelper)
      end
    end
  end
end
