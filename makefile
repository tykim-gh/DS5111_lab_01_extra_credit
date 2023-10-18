default:
	cat makefile

pg1065.txt:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

# Let's fix these up.  You've got the right idea!  But we have a couple of issues, one of them is a surprise bug actually...
# 1. Your lines as they are written pass the output of `wc -l` into a cat.  Something like this is what you intended
# `grep "Raven" pg1065.txt | wc -l > number_of_Raven.txt; cat number_of_Raven.txt`
# that makes more sense, you pipe the output of wc -l into a text file, then as a separate action cat the content.
#
# 2. the second is a bug I just realized when running this.  This is not your fault, I must have used different names
# when I was testing this.  But, it's an interesting point, you see, linux is case-insensitive, thus 
# number_of_Raven.txt is seen the same as any combination, number_of_RAVEN.txt, number_of_raven.txt etc etc.
# so what I did to get this to work right is just change `number_` to `one_`, `two_`, `three_` etc... that should get things working right!
#
raven_lines.txt:
	grep -i "raven" pg1065.txt | cat > raven_lines.txt	

number_of_Raven.txt:
	grep "Raven" pg1065.txt | wc -l | cat > number_of_Raven.txt 

number_of_RAVEN.txt:
	grep "RAVEN" pg1065.txt | wc -l | cat > number_of_RAVEN.txt

number_of_raven.txt:
	grep "ravenn" pg1065.txt | wc -l | cat > number_of_raven.txt

.PHONY: all

all: pg1065.txt raven_lines.txt number_of_Raven.txt number_of_RAVEN.txt number_of_raven.txt

clean:
	rm pg1065.txt || true
	rm raven_lines.txt || true
	rm number_of_Raven.txt || true
	rm number_of_RAVEN.txt || true
	rm number_of_raven.txt || true

