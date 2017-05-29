#!/usr/bin/env ruby
# encoding: utf-8

tag_dict = {}
open('sources/dict.txt.big') do |f|
  f.each_line do |line|
    line.chomp!
    word, freq, tag = line.split(' ')
    tag_dict[word] = tag
  end
end

seed_dict_f = open('dict/seed_dict.csv', 'w')
open('sources/cedict_ts.u8') do |f|
  line_no = 0
  line_re = /\A(.+) (.+) \[([A-Za-z1-9:,· ]+)\] \/.+\/\z/
  f.each_line do |line|
    line_no += 1
    next if line[0] == '#'

    line.chomp!
    m = line_re.match(line)
    raise "Line #{line_no}: Cannot match line format" unless m

    tag = tag_dict[m[2]]
    puts "Line #{line_no}: Cannot find jieba tag for #{m[2]}" unless tag
    tag ||= '*'

    seed_dict_f.puts("#{m[2]},0,0,0,#{tag},#{m[3]}")
  end
end
