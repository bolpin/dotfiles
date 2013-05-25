
# ARGV.concat %w( --readline )
# 
# %w(
# pp
# rubygems
# wirble
# hirb
# interactive_editor
# ).each { |x| begin; require x; rescue LoadError => e; puts e.inspect; end }
# 
# Wirble.init(:history_size => 1000)
# Wirble.colorize
# Hirb.enable


# 
# IRB.conf[:PROMPT] ||= {}
# IRB.conf[:PROMPT][:ME] = {
#   :PROMPT_I => "#{RUBY_VERSION} > ",
#   :PROMPT_S => "#{RUBY_VERSION} * ",
#   :PROMPT_C => "#{RUBY_VERSION} ? ",
#   :RETURN => "=> %s\\n"
# }
# 
# IRB.conf.merge! \\
#   :AUTO_INDENT => true,
#   :SAVE_HISTORY => 100,
#   :HISTORY_FILE => "#{ENV['HOME']}/.irb-save-history.#{RUBY_VERSION}",
#   :PROMPT_MODE => :ME
# 
# 
# # Log to STDOUT if in Rails
# if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
#   require 'logger'
#   RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
# end
# 
# class Object
#   def local_methods(obj = self)
#     (obj.methods - obj.class.superclass.instance_methods).sort
#   end
# end
# 
# # Originally inspired by http://ozmm.org/posts/railsrc.html
# if ENV['RAILS_ENV']
#   railsrc = File.expand_path("~/.railsrc")
#   # File.readlink used because I keep my actual files in a project
#   # somewhere and symlink the user dotfile.
#   puts "Loading #{railsrc}"
#   load File.readlink(railsrc) if File.exist?(railsrc)
# end
# 
# 
# # http://blog.evanweaver.com/articles/2006/12/13/benchmark/
# def benchmark(times = 1000, samples = 20)
#   times *= samples
#   cur = Time.now
#   result = times.times { yield }
#   print "#{cur = (Time.now - cur) / samples.to_f } seconds"
#   puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
#   $last_benchmark = cur
#   result
# end
# 
# def copy(obj)
#   system %{echo -n '#{obj.to_s.gsub "'", "\\\\'"}' | pbcopy}
# end
#
#
#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# ActiveRecord::Base.logger.level = 1 if defined? ActiveRecord::Base

def y(obj)
  puts obj.to_yaml
end

# class Object
#   def mate(method_name)
#     file, line = method(method_name).source_location
#     `mate '#{file}' -l #{line}`
#   end
# end

# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
# if defined? Bundler
#   Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
#   Gem::Specification.reset
#   load 'rubygems/custom_require.rb'
# end

# if defined? Rails
#   begin
#     require 'hirb'
#     Hirb.enable
#   rescue LoadError
#   end
# end

