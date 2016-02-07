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
  system %Q{mkdir -p $HOME/.config}
  system %Q{ln -s $HOME/.nvim $HOME/.config/nvim}
  system %Q{ln -s $HOME/.nvimrc $HOME/.config/nvimrc}
end

def replace_file(file, file_path)
  system "rm -rf #{file_path}"
  link_file(file, file_path)
end

def link_file(file, file_path)
  puts "linking #{file_path}"
  system %Q{ln -s "$PWD/#{file}" "#{file_path}"}
end
