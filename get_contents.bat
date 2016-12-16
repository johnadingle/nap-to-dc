for d in */ ; do  
	cd $d ;
	ls -X > contents ; 
	sed -i -e "s/TN.jpg/TN.jpg\tbundle:THUMBNAIL/g" contents ; 
	sed -i -e "s/tn.jpg/tn.jpg\tbundle:THUMBNAIL/g" contents ; 
	sed -i -e "s/contents//g" contents ; 
	METADATA=$(find . -name "*.xml" -type f );
	"c:/program files/java/jre1.8.0_77/bin/java.exe" -jar ../saxon9he.jar -s:$METADATA -xsl:../iso_to_dc.xsl -o:dublin_core.xml ;
	cd .. ; 
done