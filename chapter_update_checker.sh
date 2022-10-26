#!/bin/bash

username=$(whoami)

# -Guardian Blue-
echo "Searching for available chapters..."
wget https://archiveofourown.org/works/13874982/navigate -qP /home/$username/
grep "/works/13874982/chapters" navigate >> /home/$username/cuc-output.txt

# Number of chapters published

# Alternative way of counting the lines: lines=$(awk 'END { print NR }' cuc-output.txt)
lines=$(wc -l < /home/$username/cuc-output.txt)

# last chapter I have read
last_chapter=21

# becaouse why not see every chapter grep found right
cat /home/$username/cuc-output.txt
# ignore the weird symbols, this is just the colorful text output.
echo -e "\e[1;32mAvailable chapters of: \e[1;31mGuardian Blue Season 3\e[1;31m"
echo -e "\e[1;32mThe latest released chapter is \e[1;31m$lines\e[1;32m. The last chapter you have read is \e[1;31m$last_chapter\e[1;32m.\033[0m"

# removes the unused files
rm /home/$username/navigate
rm /home/$username/cuc-output.txt

# -------------------------------------------Break between the books-------------------------------# 
sleep 1

# -FoE PH Speak-
echo "Searching for available chapters..."
wget https://www.fimfiction.net/story/download/360410/html -qP /home/$username/
grep "https://www.fimfiction.net/story/360410" html >> /home/$username/cuc-output.txt

# Number of chapters published

# Alternative way of counting the lines: lines=$(awk 'END { print NR }' output.txt)
lines=$(wc -l < /home/$username/cuc-output.txt)

# last chapter I have read
last_chapter2=26

# becaouse why not see every chapter grep found right
cat /home/$username/cuc-output.txt
# ignore the weird symbols, this is just the colorful text output.
echo -e "\e[1;32mAvailable chapters of: \e[1;31mFoE PH Speak\e[1;31m"
echo -e "\e[1;32mThe latest released chapter is \e[1;31m"$(($lines-1))"\e[1;32m. The last chapter you have read is \e[1;31m$last_chapter2\e[1;32m."

# removes the unused files
rm /home/$username/html
rm /home/$username/cuc-output.txt

# Any other book from Archive of Our Own and fimfiction will most likely work.
# Sleep is so high becaouse otherwise the script will close the second it finishes.
sleep 120
