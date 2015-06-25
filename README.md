# Icecat to SPHERE.IO demo data preprocessor

the goal of this set of scripts is to generate a set of CSV files suitable for import into a SPHERE.IO project that contain a subset of the icecat.biz open catalog. 

The initial state will not yet create product types with "real" SPHERE.IO attributes but just require a generic product type. 
 
Next steps on the list (next to fixing the github issues and TODOs)

 1. implement category import based on halo's reimplementation (categories are a flat list here) once it can read the tree
 1. move category mapping to externalId once product import supports that
 1. set up a decent shopfront example  and make sure it's "noindex" for/against google
 1. Multilanguage also for products (maybe add more columns in separate import steps instead of joining everything into the big CSV?)
 1. incremental updates using the daily incremental feed
 1. try to get a price feed from icecat (they have a price comparison functionality)
 1. (maybe) download the XML sheets and add the actual product facts into the generic "Product Attributes" set attribute -> requires incremental update implementation
 1. (maybe) generate product types from the metadata (will be 1:1 to categories) and import the Product attributes into real category-specific attributes. 

## caveats
 * the product variant grouping is not done via the "official" icecat 
"Model" but via a self-generated slug from category, manufacturer and name.  This is because the icecat model name is only in the XML sheets and the current implementation does not download these. 
     
## prerequisites

to run on Mac OS X you need 1-2 GB free RAM and the following prerequisites in an up-to-date version (install commands)

```
brew install python
pip install csvkit
brew install node
npm install sphere-product-type-json-generator
npm install csv-mapper
npm install sphere-node-product-csv-sync
npm install sphere-category-sync

```

## prepare a SPHERE project
 * need "en" as language and ideally the following countries: EN,NL,FR,DE,IT,ES
 * create tax categories etc. with name "default", 
 * create the product type via impex.sphere.io using the product-type.json file in this directory
 * YOU DO NEED TO ADD PROJECT CREDENTIALS TO THE ./bin/6_sync_sphere_all.sh script! 

## run

The shell scripts in the /bin folder are numbered and should be executed in that order. 

Execution of this job will take a long time. you have been warned. 
