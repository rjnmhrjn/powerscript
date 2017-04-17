import zipfile

zip_ref = zipfile.ZipFile("C:\\Users\\rmaharjan\\Desktop\\Dev\\Filename.zip", "r")
zip_ref.extractall("C:\\Users\\rmaharjan\\Desktop\\Dev\\Filename")
zip_ref.close()