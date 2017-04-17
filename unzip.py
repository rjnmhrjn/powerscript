import sys
import zipfile

zip_ref = zipfile.ZipFile("C:\\Users\\rmaharjan\\Desktop\\Dev\\Asia Today Limited.zip", "r")
zip_ref.extractall("C:\\Users\\rmaharjan\\Desktop\\Dev\\Asia Today Limited")
zip_ref.close()