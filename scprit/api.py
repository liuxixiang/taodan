# -*- coding: utf-8 -*-  

from urllib import request
from urllib import parse

urls = []
url = "http://120.24.243.205/member/task/saveUserTask"

hearders ={
   'method':'POST',
   'content-type': 'application/json; charset=utf-8',
   'appId': 'taodan',
    'version': '1.0.0',
    'clientType': 'android',
    'channel': 'null',
    'deviceId': 'generic_x86',
    # 'sign': getSign(),
    # 'timestamp':getTs(),
    'nonce':'',
    # 'token','eyJhbGciOiJIUzUxMiJ9.eyJjcmVhdGVkIjoxNjAwMzQ3ODQzNzgxLCJzZWNyZXQta2V5IjoiMjdmbnM5IiwiaG9sZHRpbWUiOjE2MDAzNDg0NDM3ODEsImV4cCI6MTYwMDM0Nzk2MywicXVzdGFsbCI6IjIwMjAwOTA4MTU1MzEwMTgwMzcwOTExNTIiLCJncm91cCI6IjA1MjllYWQ1ZDkyNDRiNWVhOGM0NzZhZmZmY2FkZDg2In0.T2BqLPHv0kQjQDB37-g4n5K-a3d3B-Wnc6PO5dyFet29ghDT7ahn10WRn6gauAZKNaZnKurX3bG7Vgjt2zM3iA'
}
response = request.urlopen(url,headers = hearders)
text = response.read()
print(text)