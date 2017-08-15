require "hello_snatch/version"
require "hello_snatch/headers"
require "pry"

module HelloSnatch
  class Serve
    include HelloSnatch::Headers
    def call(env)
      self.check_for_flags(env)

      [200, {}, ["Catch-all response heard #{env["REQUEST_PATH"]}\n"]]
    end
  end
end
