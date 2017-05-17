# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + "/pmidAPA.rb"
listFile = ARGV[0]


citeFile = Time.now.strftime("%Y%m%d") + ".cite.txt"
reader = open(listFile)
writer = File.new(citeFile, "w")
cite = []
idlist = []
charlen = 0
i=0

reader.each_line {|line|
  idlist[i] = line.to_i
  i = i+1}

for i in 0..idlist.size-1
  cite[i] = pmidAPA(idlist[i].to_s)
#  p cite[i]
  sleep(0.1)
end

cite.sort!
for i in 0..cite.size-1
  writer.puts(""+cite[i]+"\r\n\r\n")
  charlen = charlen +  cite[i].length
end
writer.close
# p "Char:" + cahrlen.inject(:+).to_s
p "Char:" + charlen.to_s
p 'listFileName: ' + listFile.to_s
p "citeFile: "+citeFile
