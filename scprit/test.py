# -*- coding: utf-8 -*-   
import os 
from ruamel import yaml


current = os.path.abspath(__file__)
parent = os.path.abspath(os.path.join(current, "../../assets/images"))  

# 过滤一些不需要的文件名
def filter(fileName):
    return fileName.__eq__(".DS_Store") or fileName.__eq__("2.0x") or fileName.__eq__("3.0x")

#查找的图片根目录
def findPath():
    listDir =  []
    currentFile = ''
    listCode.append("class AssetsUtil {")
    for fileName in os.listdir(parent):
        if not filter(fileName):
            listDir.append(fileName)
            listDirName.append("assets/images/"+fileName+"/")
            currentFile = fileName
            listCode.append(' static const {0} {1} = {0}();'.format(currentFile.capitalize(),currentFile))
            # print('  static const String {0}_path = IMAGE_PATH + "{0}/";'.format(currentFile))
    listCode.append('}')
    createInnerClass(listDir)

# 创建内部类
def createInnerClass(listDir):
    for item in listDir:
        listCode.append("class {0} {{".format(item.capitalize()))    
        listCode.append("   const {0}();".format(item.capitalize()))
        listCode.append('   static const String {0}_path = "assets/images/" + "{0}/";'.format(item))
        listCode.append('   final String path = "assets/images/" + "{0}/";'.format(item))
        parseInnerImage(item)
        listCode.append("}")
        listCode.append("\n")

# 创建内部类的变量 
def parseInnerImage(item):
    for pic in os.listdir(parent+"/"+item):
        if not filter(pic):
            listCode.append('  final String {0} = {1}_path +"{2}";'.format(pic.split(".")[0],item,pic))

def parseYaml():
    fliePath =   os.path.abspath(os.path.join(current, "../../pubspec.yaml"))
    a = open(fliePath,"r")
    data =   yaml.load(a.read(),Loader=yaml.Loader)
    data["flutter"]["assets"] = listDirName
    with open(fliePath, "w", encoding="utf-8") as f:
        yaml.dump(data, f, Dumper=yaml.RoundTripDumper)
    # with open(flie) as f:
    #     x = yaml.load(f) 
    #     # print(x)
    #     print(x["flutter"]["assets"])     
    #     x["flutter"]["assets"] = listDirName
    #     print(x["flutter"]["assets"])

listCode = []
listDirName =  []
listCode.append("//不要修改这个类,这个类由create.py自动生成。。。")
findPath()    
parseYaml()

filename = os.path.abspath(os.path.join(current, "../../lib/utils/assets_util.dart"))
with open(filename, 'w') as file_object:
    for codeLine in listCode:
        file_object.write(codeLine+"\n")     
# def findImage(dirName):
#     parent = os.path.abspath(os.path.join(os.getcwd(), "../images/"+dirName))   
#     for fileName in os.listdir(parent):
#         print('  static const String {0}_path = IMAGE_PATH + "{0}";'.format(fileName))         

