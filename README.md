# nap-to-dc

Script to take packages including images files and NAP metadata and package for upload to DSpace via Batch Upload zip process.

Add the packages to the folder containing script and run get_contents.bat. The script creates a dc metadata file and a contents file.

Procedure

1. Put get_contents.bat, iso_to_dc.xsl, and saxon9he.jar in a folder.
2. For each DSpace item to be created, add a folder in the same folder containing all files to be added to the item (tiff, geotiff, jpg, NAP metadata.xml)
3. From bash, run get_contents.bat. It should create a dublin_core.xml and and contents file in each item folder
4. This should be all that is needed to create a .zip file that DSpace can ingest through batch upload
