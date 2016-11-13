extends Node

func numToStr(num, base):
	if num == 0:
		return "0"
		
	var tmp = ""
	
	while num != 0:
		var rem = num % base
		if rem > 9:
			tmp += str(rem - 10)
		else:
			tmp += str(rem)
		num = num/base
		
	var ret = tmp
	for i in range(tmp.length()):
		ret[i] = tmp.ord_at(tmp.length() - i - 1)
	return ret
	
func binStrToInt(s):
	var res = 0
	var i = s.length() - 1
	while i >= 0:
		if s[i] == '1':
			res += pow(2, s.length() - i - 1)
		i -= 1
	return res