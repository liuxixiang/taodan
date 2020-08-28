# -*- coding: utf-8 -*-   
import os 

def filter(fileName):
    return fileName.__eq__(".DS_Store") or fileName.__eq__("2.0x") or fileName.__eq__("3.0x")

def findPath(file_dir):
    parent = os.path.abspath(os.path.join(os.getcwd(), "../images"))
    listDir =  []
    currentFile = ''
    listCode.append("class AssetsUtil {")
    for fileName in os.listdir(parent):
        if not filter(fileName):
            listDir.append(fileName)
            currentFile = fileName
            listCode.append(' static const {0} {1} = {0}();'.format(currentFile.capitalize(),currentFile))
            # print('  static const String {0}_path = IMAGE_PATH + "{0}/";'.format(currentFile))
    listCode.append('}')
    createInnerClass(listDir)

def createInnerClass(listDir):
    for item in listDir:
        listCode.append("class {0} {{".format(item.capitalize()))    
        listCode.append("   const {0}();".format(item.capitalize()))
        listCode.append('   static const String {0}_path = "assets/images/" + "{0}/";'.format(item))
        listCode.append('   final String path = "assets/images/" + "{0}/";'.format(item))
        parseInnerImage(item)
        listCode.append("}")
        listCode.append("\n")

def parseInnerImage(item):
    parent = os.path.abspath(os.path.join(os.getcwd(), "../images/"+item))
    for pic in os.listdir(parent):
        if not filter(pic):
            listCode.append('  final String {0} = {1}_path +"{2}";'.format(pic.split(".")[0],item,pic))


listCode = []
listCode.append("//不要修改这个类,这个类由create.py自动生成。。。")
findPath(os.getcwd())      
filename = os.path.abspath(os.path.join(os.getcwd(), "../../lib/utils/assets_util.dart"))
with open(filename, 'w') as file_object:
    for codeLine in listCode:
        file_object.write(codeLine+"\n")     
# def findImage(dirName):
#     parent = os.path.abspath(os.path.join(os.getcwd(), "../images/"+dirName))   
#     for fileName in os.listdir(parent):
#         print('  static const String {0}_path = IMAGE_PATH + "{0}";'.format(fileName))         

