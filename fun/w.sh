#!/bin/sh

link="https://unsw-my.sharepoint.com/personal/z5117173_ad_unsw_edu_au/_layouts/15/guestaccess.aspx?docid=1a591e707c54844fcb98d2fad50e36699&authkey=AZIvxBgAavEAVsMvZ5bV4YI"

wget -q -O- $link | egrep "COMP3161"
