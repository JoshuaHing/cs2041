#!/bin/bash

for x in "$@/"
do
    #echo "$x"
    for y in "$x/"*
    do
        if test -r "$y"
        then
            string=`id3 -l "$y"|head -1`
            #echo "$string"
            if [[ $string == "[a-z]*-[a-z]*" ]]
            then
                title=`echo $string |cut -d"-" -f2-3|sed 's/ $//g'|sed 's/^ //g'`
            else 
                title=`echo $string |cut -d"-" -f2|sed 's/ $//g'|sed 's/^ //g'`
            fi
            album=`echo $string |cut -d"/" -f2|sed 's/ $//g'|sed 's/^ //g'`
            if [[ $string == ^".*vs\..*"$ ]]
            then
                artist=`echo $string |cut -d"-" -f3|cut -d"." -f1-2|sed 's/ $//g'|sed 's/^ //g'`
            else 
                artist=`echo $string |cut -d"-" -f3|cut -d"." -f1|sed 's/ $//g'|sed 's/^ //g'`
            fi
            year=`echo $string |cut -d"/" -f2|cut -d"," -f2|sed 's/ $//g'|sed 's/^ //g'`
            track=`echo $string |cut -d"/" -f3-4|cut -d"/" -f2|cut -d"-" -f1|sed 's/ $//g'|sed 's/^ //g'`
            id3 -t "$title" -A "$album" -a "$artist" -y "$year" -T "$track" "$y" > /dev/null
         else
            break
         fi    
    done
done
