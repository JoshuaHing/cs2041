from subprocess import call


#get course

course = "comp4128"
course.upper()

year = "2019"
startURL = "timetable.unsw.edu.au" + "/" + year + "/" + course + ".html"

call(["wget -q -O- timetable.unsw.edu.au/2019/COMP4128.html | egrep 'Enrols/Capacity' -A 2 | egrep '<td class=\"data\">' | sed 's/^[[:space:]]*//g' | sed 's/<[^0-9]*>//g' > 'output.txt'"], shell=True)

file = open("output.txt", "r")

(curr, cap) = file.read().split("/")
print(curr + "," + cap)
