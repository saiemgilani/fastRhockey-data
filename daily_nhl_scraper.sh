#!/bin/bash
while getopts s:e:r: flag
do
    case "${flag}" in
        s) START_YEAR=${OPTARG};;
        e) END_YEAR=${OPTARG};;
        r) RESCRAPE=${OPTARG};;
    esac
done
git pull > /dev/null
git add . > /dev/null
Rscript nhl_daily_scrape.R -s $START_YEAR -e $END_YEAR -r $RESCRAPE
git add . > /dev/null
git pull > /dev/null
git commit -m "NHL Play-by-Play and Schedules update (Start: $START_YEAR End: $END_YEAR)" > /dev/null || echo "No changes to commit"
git pull > /dev/null
git push > /dev/null