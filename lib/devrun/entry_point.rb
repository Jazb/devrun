require 'devrun'

module Devrun
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Devrun::Resolver.call(args)
      Devrun::Executor.call(cmd, command_name, args)
    end
  end
end
