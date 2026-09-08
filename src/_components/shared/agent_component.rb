module Shared
  class AgentComponent < Bridgetown::Component
   def initialize()
   end

    def render_in(view_context)
      super(view_context).html_safe
    end
  end
end

