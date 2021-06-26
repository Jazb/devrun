require 'devrun'

module Devrun
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Example, 'example', 'devrun/commands/example'
    register :Help,    'help',    'devrun/commands/help'
  end
end
