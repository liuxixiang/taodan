# -*- coding: utf-8 -*-   
  
import os  
# from pathlib2 import Path

newName = "close_icon"
moudle_name = "test"
def renameImage(file_dir):   
   path = file_dir
   parent = os.path.abspath(os.path.join(os.getcwd(), ".."))
   if len(os.listdir(file_dir))>2:
      for file in os.listdir(file_dir):
         if(file.endswith("png") and not(file.__contains__("@"))):
            fileName = file.split(".")[0]
        #    print(parent+"/images/"+moudle_name+"/"+newName+".png")
        #    print(parent+"/images/"+moudle_name+"/2.0x/"+newName+".png")
        #    print(parent+"/images/"+moudle_name+"/3.0x/"+newName+".png")
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
               os.rename(path+"/"+file,newFilePath)
               os.rename(path+"/"+fileName+"@2x.png",path2x)
               os.rename(path+"/"+fileName+"@3x.png",path3x)
               print("替换成功")
   else:
      print("没有图片")

renameImage(os.getcwd())
