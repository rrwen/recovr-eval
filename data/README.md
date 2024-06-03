# Cycling Infrastructure Intervention Evaluations
  
This folder contains data used for the analysis code in the [src](../src) folder.

## Data

Each data file contains the following:

* **Download Date**: The date that the file was downloaded in the file name as the suffix (e.g. `some-data-2024-01-30.csv` was downloaded on January 30, 2024)
* **Data Dictionary**: An accompanying data dictionary CSV file, describing each column, identified with suffix `-datadict.csv` (e.g. a data file `some-data-2024-01-30.csv` has a data dictionary `some-data-2024-01-30-datadict.csv`). Each data dictionary has the following columns:
	* `column`: name of the column
	* `description`: description for the column
	* `data_type`: general data type (one of `numeric`, `text`, `date`, `datetime` `time`, or `geometry`)

For information on all data in this folder, see [data.csv](data.csv), which has information on:

* `file`: relative path to the data file
* `description`: description for the data file
* `update_date`: date that the data file was updated according to the `url` at the time of `download_date`
* `download_date`: date that the data file was downloaded from the `url`
* `url`: the link to download the data
* `notes`: additional notes for the data file

## Data Updates

When updating or adding data files, follow the naming convention `name-subname-2024-01-01.csv`:

* `name-subname-` is the name and any subnames with dash separators
* `2024-01-01.csv` is the date of the download in order of year, month, day with the file extension after the period `.`

Add an entry to or update the `data.csv` file, and add a data dictionary file with the same name suffixed with `-datadict` followed by the file extension. For example, `name-subname-2024-01-01-datadict.csv`

## Contact

Richard Wen <rrwen.dev@gmail.com>
