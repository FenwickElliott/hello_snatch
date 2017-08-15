require "hello_snatch/version"

module HelloSnatch
  class Serve
    def call(env)
      binding.pry if env["HTTP_PRY"]
      puts env.inspect if env["HTTP_PUTS"]

      [200, {}, ["Catch-all response heard #{env["REQUEST_PATH"]}\n"]]
    end
  end
end
