module Sapphire
  module DSL
    module Browser
      def Contain(item)
        Contain.new(item)
      end

      class Contain < Verb
        def execute
           @item.Contain(@item, @modifier)
        end
      end
    end
  end
end

