require 'devrun'

module Devrun
  module Commands
    class Example < Devrun::Command
      def call(_args, _name)
        puts 'neato'

        if rand < 0.05
          raise(CLI::Kit::Abort, "you got unlucky!")
        end
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{Devrun::TOOL_NAME} example}}"
      end
    end
  end
end
