# RECOVR Cycling Evaluation Experiments

* [R Code for Model Data](https://rrwen.github.io/recovr-eval/)
* [R Code for Toronto Bikeway Checks](https://rrwen.github.io/recovr-eval/archive/check-toronto-bikeways)
* [R Code for Vancouver KSI Checks](https://rrwen.github.io/recovr-eval/archive/check-vancouver-ksi)
* [R Code for Bloor, University, Danforth, and Yonge Experiment](https://rrwen.github.io/recovr-eval/archive/collisions-bloorunidanyonge)

Cycling infrastructure experiments for the RECOVR initiative (Road-safety Evaluation during COVID-19 among Vulnerable Road Users in Canada).  
  
## Folder Structure

* `data`: contains the raw and pre-processed data
	* For a description of pre-processed data, see [data.csv](data/data.csv)
	* Each data file ending in `-datadict` contains the data dictionary of column names and descriptions
* `docs`: contains the resulting HTML files from running code in the `src` folder
* `figures`: contains image files of generated figures
* `slides`: contains presentation slides
* `src`: code files for data processing and modelling
	* The main file is [index.Rmd](src/index.Rmd)
* `tmp`: folder for temporary and untracked files

## Contact

Richard Wen <rrwen.dev@gmail.com> for any code or technical related issues.
