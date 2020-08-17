# -*- coding: utf-8 -*-   
  
import os  
newName = "wendjia"
moudle_name = "login"
def renameImage(file_dir):   
   path = file_dir
   parent = os.path.abspath(os.path.join(os.getcwd(), ".."))
   for file in os.listdir(file_dir):
       if(file.endswith("png") and not(file.__contains__("@"))):
           fileName = file.split(".")[0]
        #    print(parent+"/images/"+moudle_name+"/"+newName+".png")
        #    print(parent+"/images/"+moudle_name+"/2.0x/"+newName+".png")
        #    print(parent+"/images/"+moudle_name+"/3.0x/"+newName+".png")
           os.rename(path+"/"+file,parent+"/images/"+moudle_name+"/"+newName+".png")
           os.rename(path+"/"+fileName+"@2x.png",parent+"/images/"+moudle_name+"/2.0x/"+newName+".png")
           os.rename(path+"/"+fileName+"@3x.png",parent+"/images/"+moudle_name+"/3.0x/"+newName+".png")


print("Hello, World!")
renameImage(os.getcwd())
