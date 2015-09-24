#!/bin/bash -l

#cd /home/oscar/.simonj/dcled_ruby

#./dcled -r -m 123 -s 80
#curl --silent https://api.tfl.gov.uk/StopPoint/490001171G/arrivals  | ../jq 'sort_by(.timeToStation) | .[] | select(.lineId=="390") | .timeToStation' | head -n 2 | xargs -I {} date -u -d @{} +"%T" | cut -d ':' -f 2,3  | awk '{printf("%02d @ %s\n", NR, $0)}'  | xargs -I {} ruby dcled_ruby.rb -m {}

#curl --silent https://api.tfl.gov.uk/StopPoint/490001171G/arrivals  | ../jq 'sort_by(.timeToStation) | .[] | select(.lineId=="390") | .timeToStation' | head -n 1 | xargs -I {} date -u -d @{} +"%T" | xargs -I {} ruby dcled_ruby.rb -m {}

while [ true ]; do
	#curl --silent https://api.tfl.gov.uk/StopPoint/490001171G/arrivals  | ../jq 'sort_by(.timeToStation) | .[] | select(.lineId=="390") | .timeToStation' | head -n 2 | xargs -I {} date -u -d @{} +"%T" | cut -d ':' -f 2,3 | tr ':' 'm:'  | awk '{printf("%01d) %ss\n", NR, $0)}'
	curl --silent https://api.tfl.gov.uk/StopPoint/490001171G/arrivals  | ../jq 'sort_by(.timeToStation) | .[] | select(.lineId=="390") | .timeToStation' | head -n 2 | xargs -I {} date -u -d @{} +"%T" | cut -d ':' -f 2,3 | tr ':' 'm:'  | awk '{printf("%01d) %ss\n", NR, $0)}'
	echo "   "	
	sleep 60
done
