desc 'dev server'
task :serve do
  sh "bundle exec thin -A file -c ./ -a 0.0.0.0 -p 3000 start"
end

task :clean do
  sh "rm -rf build"
end

task :compile do
 sh "mkdir -p build/sass"  
 sh "rm -rf build/stylesheets"
 sh "mkdir -p build/stylesheets"
 sh "find ./stylesheets -type f -name *.scss -exec cat {} > build/sass/style.scss \\;"     
 sh "find ./src -type f -name *.scss -exec cat {} >> build/sass/style.scss \\;"     
 sh "sass --update build/sass:build/stylesheets --trace"  
end

task :build_require => :clean do
  sh "node tools/r.js -o build.js"
end

task :sass_compile => [:compile] do
  ##compile.. 
end

task :cleanup do
  sh "rm -rf build/sass"
  sh "rm -rf build/node_modules"
  sh "rm -rf build/tools"
  sh "rm -rf build/Gemfile"
  sh "rm -rf build/Gemfile.lock"
  sh "rm -rf build/package.json"
  sh "rm -rf build/Rakefile"
  sh "rm -rf build/README.md"
  sh "rm -rf build/build.js"
  sh "rm -rf build/build.txt"
  sh "rm -rf build/docs"
end

task :build => [:clean, :build_require, :sass_compile, :cleanup] do
  puts "DONE"
end

