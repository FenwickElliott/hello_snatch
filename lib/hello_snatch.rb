require "hello_snatch/version"
require "pry"

module HelloSnatch
  class Serve
    def call(env)
      binding.pry if env["HTTP_PRY"]
      puts env.inspect if env["HTTP_PUTS_ENV"]
      puts eval env["HTTP_PUTS_THIS"] if env["HTTP_PUTS_THIS"]

      [200, {}, ["Catch-all response heard #{env["REQUEST_PATH"]}\n"]]
    end
  end
end
