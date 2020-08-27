# -*- coding: utf-8 -*-   
  
import os  
# from pathlib2 import Path

newName = "close_icon"
moudle_name = "test"
def findImage(file_dir):   
   path = file_dir
   parent = os.path.abspath(os.path.join(os.getcwd(), ".."))
   fileCount = 0
   fileName = ""
   for file in os.listdir(file_dir):
      if(file.endswith("png") and not(file.__contains__("@"))):
         fileName = file.split(".")[0]
         fileCount = fileCount+1
   if fileCount==0:
      print("没图片换个j8")
   elif fileCount==1:
      renameImage(path,parent,fileName)
   elif fileCount==2:
      print("一次只能替换一套图片")


def renameImage(path,parent,fileName):
   newFilePath = parent+"/images/"+moudle_name+"/"+newName+".png"
   if os.path.exists(newFilePath):
      print("文件已存在,失败")
   else:
      path2x = parent+"/images/"+moudle_name+"/2.0x/"
      path3x = parent+"/images/"+moudle_name+"/3.0x/"
      if not (os.path.exists(path2x)):
         os.makedirs(path2x)
      if not (os.path.exists(path3x)):
         os.makedirs(path3x)  
      os.rename(path+"/"+fileName+".png",newFilePath)
      os.rename(path+"/"+fileName+"@2x.png",path2x+newName+".png")
      os.rename(path+"/"+fileName+"@3x.png",path3x+newName+".png")
      print("替换成功")      

findImage(os.getcwd())

