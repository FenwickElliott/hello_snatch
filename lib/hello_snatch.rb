require "hello_snatch/version"
require "hello_snatch/headers"
require "pry"
require "erubis"

module HelloSnatch
  class Serve
    include HelloSnatch::Headers
    def call(env)
      self.check_for_flags(env)

      temp = File.dirname(__FILE__) + "/views#{env['PATH_INFO']}.html.erb"

      if File.exist?(temp)
        [200, {'Content-Type' => 'text/html'}, [File.read(temp)]]
      else
        [404, {'Content-Type' => 'text/html'}, [File.read(File.dirname(__FILE__) + "/views/404.html.erb")]]
      end
    end
  end
end
