require 'cucumber/smart_ast/listeners_broadcaster'

module Cucumber
  module SmartAst
    class Run
      def initialize(listeners, step_mother = StepMother.new)
        @listeners = listeners.extend(ListenersBroadcaster)
        @step_mother = step_mother
      end
      
      def execute(units)
        units.each do |unit|
          unit.execute(@step_mother, @listeners)
        end
      end
    end
  end
end