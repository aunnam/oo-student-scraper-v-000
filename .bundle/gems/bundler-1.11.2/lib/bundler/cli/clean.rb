module Bundler
  class CLI::Clean
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      require_path_or_force
      Bundler.load.clean(options[:"dry-run"])
    end

  protected

    def require_path_or_force
      if !Bundler.settings[:path] && !options[:force]
        Bundler.ui.error "Cleaning all the gems on your system is dangerous! " \
          "If you're sure you want to remove every system gem not in this " \
          "bundle, run `bundle clean --force`."
        exit 1
      end
    end
  end
end
