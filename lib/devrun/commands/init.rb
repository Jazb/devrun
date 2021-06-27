require 'devrun'

module Devrun
  module Commands
    class Init < Devrun::Command
      def call(_args, _name)
        puts(". '#{File.realpath(File.expand_path('../../../dev.sh', __dir__))}'")
      end
    end
  end
end