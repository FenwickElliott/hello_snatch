module HelloSnatch
    module Headers
        def check_for_flags(env)
            binding.pry if env["HTTP_PRY"]
            puts env.inspect if env["HTTP_PUTS_ENV"]
            puts eval env["HTTP_PUTS_THIS"] if env["HTTP_PUTS_THIS"]
        end
    end
end