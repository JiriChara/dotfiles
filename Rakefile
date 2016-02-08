# Rakefile
require 'rake'

skip_files = %w[
  Rakefile
  README.markdown
]

desc "install vim files into user's home directory"
task :install do
  replace_all = false

  Dir['*'].each do |file|
    next if skip_files.include?(file)

    file_path = File.join(ENV['HOME'], ".#{file}")

    if File.exists?(file_path)
      if File.identical?(file, file_path)
        puts("identical #{file_path}")
      elsif replace_all
        replace_file(file, file_path)
      else
        print "overwrite #{file_path}? [ynaq]"
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, file_path)
        when 'y'
          replace_file(file, file_path)
        when 'q'
          exit
        else
          puts "skipping #{file_path}"
        end
      end
    else
      link_file(file, file_path)
    end
  end

  # Symlink neovim configs
  home = ENV['HOME']
  config_path = File.join(home, '.config')
  nvim_path = File.join(home, '.config/nvim')
  nvimrc_path = File.join(home , '.config/nvimrc')

  if !File.exists?(config_path)
    system %Q{mkdir -p #{config_path}}
  end

  if !File.exists?(nvim_path)
    system %Q{ln -s #{File.join(home, '.nvim')} #{nvim_path}}
  end

  if !File.exists?(nvimrc_path)
    system %Q{ln -s #{File.join(home, '.nvimrc')} #{nvimrc_path}}
  end
end

def replace_file(file, file_path)
  system "rm -rf #{file_path}"
  link_file(file, file_path)
end

def link_file(file, file_path)
  puts "linking #{file_path}"
  system %Q{ln -s "$PWD/#{file}" "#{file_path}"}
end
