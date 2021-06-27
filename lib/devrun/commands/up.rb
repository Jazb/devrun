require 'devrun'

module Devrun
  module Commands
    class Up < Devrun::Command
      def call(args, _name)
        Devrun::Project.current.config['up'].each do |task|
          puts "no idea how to run this task:"
          puts "  #{task.inspect}"
        end
        raise(AbortSilent)
      end

      def self.help
        'TODO'
      end
    end
  end
end