require 'devrun'

module Devrun
  module Commands
    class Help < Devrun::Command
      def call(args, _name)
        puts CLI::UI.fmt("{{bold:Available commands}}")
        puts ""

        Devrun::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == 'help'
          puts CLI::UI.fmt("{{command:#{Devrun::TOOL_NAME} #{name}}}")
          next unless klass.respond_to?(:help)
          if help = klass.help
            puts CLI::UI.fmt(help)
          end
          puts ""
        end
      end
    end
  end
end