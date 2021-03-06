

# Add current dir
$:.unshift(File.dirname(__FILE__))


module Ginst

  @@data_dir = ENV['GINST_DATA']
  @@root = File.expand_path(File.dirname(__FILE__)+'/..')
  
  autoload(:Plugin, 'ginst/plugin')
  autoload(:ConsoleToHtml, 'ginst/console_to_html')
  autoload(:Builder, 'ginst/builder')
  autoload(:Ssh, 'ginst/ssh')
  autoload(:Template, 'ginst/template')
  autoload(:Configuration, 'ginst/configuration')
  autoload(:CLI, 'ginst/cli')
  autoload(:WebServer, 'ginst/web_server')
  autoload(:Console, 'ginst/console')
  autoload(:Logger, 'ginst/logger')
  
  def self.data_dir
    return @@data_dir if @@data_dir
    if ENV['GINST_DATA']
      @@data_dir = ENV['GINST_DATA']
    else
      $stderr <<  "Ginst need a directory to work on!!!\nPlease define GINST_DATA environment variable"
      @@data_dir = nil
    end
  end
  
  def self.root
    @@root
  end
  
  VERSION = File.read(root+'/VERSION').strip
end

# Add vendorized gems to load path
Dir.glob(Ginst.root+"/vendor/gems/*/lib").each do |path|
  path = File.expand_path(path)
  $:.unshift path unless $:.include? path
end
