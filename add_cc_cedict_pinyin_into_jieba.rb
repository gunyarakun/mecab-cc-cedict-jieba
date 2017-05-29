#!/usr/bin/env ruby
# encoding: utf-8

pinyin_dict = {}
open('sources/cedict_ts.u8') do |f|
  line_no = 0
  line_re = /\A(.+) (.+) \[([A-Za-z1-9:,· ]+)\] \/.+\/\z/
  f.each_line do |line|
    line_no += 1
    next if line[0] == '#'

    line.chomp!
    m = line_re.match(line)
    raise "CC-CEDICT Line #{line_no}: Cannot match line format" unless m

    pinyin_dict[m[2]] = m[3]
  end
end

seed_dict_f = open('dict/seed_dict.csv', 'w')
open('sources/dict.txt.big') do |f|
  f.each_line do |line|
    line.chomp!
    word, freq, tag = line.split(' ')

    pinyin = pinyin_dict[word]
    puts "dict.txt.big: Cannot find pinyin on CC-CEDICT for #{word}" unless pinyin
    pinyin ||= '*'

    seed_dict_f.puts("#{word},0,0,0,#{tag},#{pinyin}")
  end
end
