desc "Ejecucion del juego PPT"
task :default do
	sh "rackup"
end

desc "Ejecutar Test Unitarios"
task :test do
  sh "ruby test/test.rb "
end

desc "Ejecutar los Test Rspec"
task :spec do
	sh "rspec spec/rsack/server_spec.rb"
end
