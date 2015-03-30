# Icecat to SPHERE.IO demo data preprocessor

the goal of this set of scripts is to generate a set of CSV files suitable for import into a SPHERE.IO project that contain a subset of the icecat.biz open catalog. 

The initial state will not yet create product types with "real" SPHERE.IO attributes but just require a generic product type. 

YOU DO NEED TO ADD PROJECT CREDENTIALS TO THE ./bin/6_sync_sphere_all.sh script! 

If you are using an own test project, you need to manually create tax categories etc. with name "default",  create the product type via impex.sphere.io using the product-type.json file in this directory and create the category/ies manually with matching names. 
 
Next steps on the list:

 1.  get cvs-mapper to a performance level that allows importing the full file
 1. implement category import based on halo's reimplementation (categories are a flat list here)
 1. Daily incremental updates 
 1. set up a decent shopfront example with faceted search etc.  
 1. Multilanguage (probably requires a more efficient technique than csvjoin)
 1. download the XML sheets and add the actual product facts into the generic "Product Attributes" set attribute. 
 1. (maybe) generate product types from the metadata (will be 1:1 to categories) and import the Product attributes into real category-specific attributes. 


## caveats
 * the product variant grouping is not done via the "official" icecat 
"Model" but via a self-generated slug from category, manufacturer and name.  This is because the icecat model name is only in the XML sheets and the current implementation does not download these yet. 
     
## prerequisites

to run on Mac OS X you need the following prerequisites (install commands)

```
brew install python
pip install csvkit
brew install node
npm install sphere-product-type-json-generator
npm install csv-mapper
npm install sphere-node-product-csv-sync

```
## run

The shell scripts in the /bin folder are numbered and should be executed in that order. 

the products are completely deleted from the SPHERE project and then recreated. 

this may take a long time. you have been warned

## WTF?
