require 'pry'
require 'yaml'

def load_library(library)
	l = Hash.new {|h,k| h[k]={} }
	lib = YAML.load_file(library)
	lib.each do |k,v|
		l["get_meaning"][v[1]] = k 
		l["get_emoticon"][v[0]] = v[1]
	end
	l

end

def get_japanese_emoticon(path, emo)
	lib = load_library(path)
	lib["get_emoticon"][emo].nil? ? "Sorry, that emoticon was not found" : lib["get_emoticon"][emo]
end

def get_english_meaning(path, emo)
	lib = load_library(path)
	lib["get_meaning"][emo].nil? ? "Sorry, that emoticon was not found" : lib["get_meaning"][emo]
end