# -*- coding: utf-8 -*-   
  
import os  
# from pathlib2 import Path

newName = "ic_question"
moudle_name = "common"
def findImage(file_dir):
   parentPath = os.path.abspath(os.path.join(os.path.abspath(__file__), "../../assets"))
   currentParent = os.path.abspath(os.path.join(os.path.abspath(__file__), "../"))
   fileCount = 0
   fileName = ""
   for file in os.listdir(currentParent):
      if(file.endswith("png") and not(file.__contains__("@"))):
         fileName = file.split(".")[0]
         fileCount = fileCount+1
   if fileCount==0:
      print("没图片换个j8")
   elif fileCount==1:
      renameImage(currentParent,parentPath,fileName)
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
      callCreate(path)


def callCreate(path):
   os.system("python {0}/create.py".format(path)) 

findImage(os.path.abspath(__file__))

