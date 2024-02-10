#!/usr/bin/env ruby

c = {}
g = ""
f = $stdin.readlines

t = {
	"bg"  => {tag: /\.bg$/,  namesuffix: "Bulgarian"},
	"mkd" => {tag: /\.mkd$/, namesuffix: "Yugoslav"},
	"pl"  => {tag: /\.pl$/,  namesuffix: "Polish"}
}

f.each {|l|
	l.chomp!
	if l =~ /^StartChar:/ then
		g = l.sub(/^StartChar:\s*(.*)$/, '\1')
	elsif l =~ /^Encoding:/ and g != "" then
		c.merge!({g => l.sub(/^Encoding:\s*(\d+)\s+(-?\d+).*$/, '\2')})
	end
}

c.each {|k, v|
	if k =~ t[$*[0]][:tag] then
		w = c[k.sub(t[$*[0]][:tag], "")]
		c[k.sub(t[$*[0]][:tag], "")] = v
		c[k] = w
	end
}

g = ""
f.each {|l|
	if l =~ /^(Font|Full|Family)Name:/ then
		l.sub!(/Inconsolata( ?)LGC/, '\&\1' + t[$*[0]][:namesuffix])
	elsif l =~ /^StartChar:/ then
		g = l.sub(/^StartChar:\s*(.*)$/, '\1')
	elsif l =~ /^Encoding:/ and g != "" then
		l.sub!(/^Encoding:\s*(\d+)\s*(-?\d+)/, 'Encoding: \1 ' + c[g])
	end
	begin
		puts l
	rescue Errno::EPIPE
	end
}
