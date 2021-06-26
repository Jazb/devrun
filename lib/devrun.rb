require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

module Devrun
  extend CLI::Kit::Autocall

  TOOL_NAME = 'devrun'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/devrun.log'

  autoload(:EntryPoint, 'devrun/entry_point')
  autoload(:Commands,   'devrun/commands')

  autocall(:Config)  { CLI::Kit::Config.new(tool_name: TOOL_NAME) }
  autocall(:Command) { CLI::Kit::BaseCommand }

  autocall(:Executor) { CLI::Kit::Executor.new(log_file: LOG_FILE) }
  autocall(:Resolver) do
    CLI::Kit::Resolver.new(
      tool_name: TOOL_NAME,
      command_registry: Devrun::Commands::Registry
    )
  end

  autocall(:ErrorHandler) do
    CLI::Kit::ErrorHandler.new(
      log_file: LOG_FILE,
      exception_reporter: nil
    )
  end
end
