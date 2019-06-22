#!/bin/sh

#find ./ -type f "*.java" -exec perl -p -i -e 's!FBReaderMolitfelnic.ORG!FBReader.ORG!g' {} +
#git clone -b bibliotecaortodoxa --single-branch https://github.com/aplicatii-romanesti/FBReader-Android-2.git
#git checkout -b molitfelnic bibliotecaortodoxa

# SETUP:
NEWAPP_CAMEL=${1:-BibliaOrtodoxaAnania}   #Molitfelnic #${NEWAPP_CAMEL}
NEWAPP_SMALL=$(echo $NEWAPP_CAMEL | tr '[:upper:]' '[:lower:]' )   #molitfelnic #${NEWAPP_SMALL}
###

# Replace inside files:
### OLD STYLE
#mfbreadermolitfelnic -> mfbreader${NEWAPP_SMALL}
#romanesti_molitfelnic -> romanesti_${NEWAPP_SMALL}
# NEW Consolidated STYLE:

find ./ -type f \( -iname \*.java -o -iname \*.xml -o -iname \*.gradle -o -iname \*.properties \)

perl -p -i -e "s!molitfelnic!${NEWAPP_SMALL}!g" 
perl -p -i -e "s!Molitfelnic!${NEWAPP_CAMEL}!g"

# Replace files and folders:

git mv fbreader\app\src\main\java\org\geometerplus\zlibrary\ui\android\aplicatii\romanesti_molitfelnic\ fbreader\app\src\main\java\org\geometerplus\zlibrary\ui\android\aplicatii\romanesti_${NEWAPP_SMALL}\

git mv fbreader\app\src\main\java\org\nicolae\search_molitfelnic\ fbreader\app\src\main\java\org\nicolae\search_${NEWAPP_SMALL}\

git mv fbreader\common\src\main\java\org\geometerplus\zlibrary\ui\android\aplicatii\romanesti_molitfelnic\ fbreader\common\src\main\java\org\geometerplus\zlibrary\ui\android\aplicatii\romanesti_${NEWAPP_SMALL}\

git mv fbreader\app\src\main\java\org\geometerplus\android\fbreader\FBReaderApplicationMolitfelnic.java fbreader\app\src\main\java\org\geometerplus\android\fbreader\FBReaderApplication${NEWAPP_CAMEL}.java 

git mv fbreader\app\src\main\java\org\geometerplus\android\fbreader\FBReaderMolitfelnic.java fbreader\app\src\main\java\org\geometerplus\android\fbreader\FBReader${NEWAPP_CAMEL}.java


############# aplicatii.romanesti to molitfelnic:
# mv fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderApplicationMolitfelnic.java fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderApplication.java
# git mv fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderApplication.java fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderApplicationMolitfelnic.java

# mv fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderMolitfelnic.java fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReader.java
# git mv fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReader.java fbreader/app/src/main/java/org/geometerplus/android/fbreader/FBReaderMolitfelnic.java

# rm -rf fbreader/app/src/main/java/org/nicolae/test/
# mv fbreader/app/src/main/java/org/nicolae/search_molitfelnic/ fbreader/app/src/main/java/org/nicolae/test/
# git mv fbreader/app/src/main/java/org/nicolae/test/ fbreader/app/src/main/java/org/nicolae/search_molitfelnic/

# rm -rf fbreader/app/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/
# mv fbreader/app/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti_molitfelnic/ fbreader/app/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/
# git mv fbreader/app/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/ fbreader/app/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti_molitfelnic/

# rm -rf fbreader/common/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/
# mv fbreader/common/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti_molitfelnic/ fbreader/common/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/
# git mv fbreader/common/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti/ fbreader/common/src/main/java/org/geometerplus/zlibrary/ui/android/aplicatii/romanesti_molitfelnic/


# ###
# git checkout fbreader/common/src/main/java/org/geometerplus/fbreader/Paths.java
# git checkout fbreader/app/src/main/java/org/geometerplus/android/fbreader/network/BookDownloader.java

