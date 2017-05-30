# coding: utf-8
def pmidAPA(pmID)
  require 'nokogiri'
  require 'open-uri'
  email = 'https://github.com/rysk-t/pmid2APA'
  # pmID = '23143516' # e.g.
  # email = 'your@adress.com'
  lastn=[]
  firstn=[]
  string=''
  url = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=' + pmID + '&retmode=xml&email=' + email
  
  xml = Nokogiri::XML(open(url).read) 
  i=1
  xml.xpath('//LastName').each do |node|
	lastn[i] = node.children.text
	i=i+1;
  end
  i=1
  xml.xpath('//Initials').each do |node|
    firstn[i] = node.children.text
    i=i+1;
  end

  for i in 1..lastn.size # Author
    string = string + lastn[i].to_s + " "  + firstn[i].to_s
    if i < lastn.size-1
      string = string + ", "
    end
  end

  pubYear =  xml.xpath('//PubDate/Year').text + xml.xpath('//PubDate/MedlineDate').text
  pubYear = pubYear[0..3]
  string = string + "(" + pubYear + ") " + 
           xml.xpath('//ArticleTitle').text + " " + 
           xml.xpath('//Journal/ISOAbbreviation').text + " " + 
           xml.xpath('//JournalIssue/Volume').text + ":" + xml.xpath('//MedlinePgn').text + "."
  #  p string
  puts string
  return string
end
