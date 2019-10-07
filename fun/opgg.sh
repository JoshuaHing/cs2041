#!/bin/sh

opgg_url="http://oracleselixir.com/statistics/champions/2017-summer-champion-statistics/"


wget -O- $opgg_url | egrep "Aatrox"
