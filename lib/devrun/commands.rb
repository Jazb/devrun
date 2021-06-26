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

    autoload(:Contextual, 'devrun/commands/contextual')

    register(:Cd,     'cd',     'devrun/commands/cd')
    register(:Clone,  'clone',  'devrun/commands/clone')
    register(:Config, 'config', 'devrun/commands/config')
    register(:Help,   'help',   'devrun/commands/help')
    register(:Init,   'init',   'devrun/commands/init')
    register(:Open,   'open',   'devrun/commands/open')
    register(:Up,     'up',     'devrun/commands/up')
  end
end
