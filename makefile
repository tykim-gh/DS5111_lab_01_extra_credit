default:
	cat makefile

pg1065.txt:
	wget https://www.gutenberg.org/cache/epub/1065/pg1065.txt

# Here are my edits per your comments.
# Hopefully they are in working order now!

raven_lines.txt:
	grep -i "raven" pg1065.txt | cat > raven_lines.txt	

number_of_Raven.txt:
	grep "Raven" pg1065.txt | wc -l > one_Raven.txt; cat one_Raven.txt 

number_of_RAVEN.txt:
	grep "RAVEN" pg1065.txt | wc -l > two_RAVEN.txt; cat two_RAVEN.txt

number_of_raven.txt:
	grep "raven" pg1065.txt | wc -l > three_raven.txt; cat three_raven.txt

.PHONY: all

all: pg1065.txt raven_lines.txt number_of_Raven.txt number_of_RAVEN.txt number_of_raven.txt

clean:
	rm pg1065.txt || true
	rm raven_lines.txt || true
	rm one_Raven.txt || true
	rm two_RAVEN.txt || true
	rm three_raven.txt || true

