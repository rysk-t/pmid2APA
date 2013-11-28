# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + "/pmidAPA.rb"

listFile = ARGV[0]
mail = ARGV[1]

citeFile = Time.now.strftime("%Y%m%d_%H%M%S") + ".cite.txt"
reader = open(listFile)
writer = File.new(citeFile, "w")
cite = []
idlist = []
i=0

reader.each_line {|line|
  idlist[i] = line.to_i
  i = i+1}

for i in 0..idlist.size-1
  cite[i] = pmidAPA(idlist[i].to_s, ARGV[1])
#  p cite[i]
  sleep(1)
end

cite.sort!
for i in 0..cite.size-1
  writer.puts("* "+cite[i]+"\r\n\r\n")
end
writer.close

p 'listFileName: ' + listFile.to_s
p "citeFile: "+citeFile
