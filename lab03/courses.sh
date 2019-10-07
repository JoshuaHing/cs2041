#!/bin/sh

# Retrieve the first letter of the first argument.
subject_letter=`echo $1 | head -c 1`
# Set the urls of the handbook.
undergrad_url="http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$subject_letter"
postgrad_url="http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$subject_letter"
# Filter through webpage content to get the desired format.
# (some funny stuff made it through the filter, hence the last command.)
wget -q -O- $undergrad_url $postgrad_url|egrep "$1"|egrep "href"|cut -d'/' -f7-8| cut -d"<" -f1 |sed s/\.html\"\>/" "/g|sed 's/ *$//g'|sort|uniq|egrep $1
