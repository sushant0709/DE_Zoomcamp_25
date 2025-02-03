#!/bin/bash

# Create a new directory called 'dataset'
mkdir -p dataset
cd dataset

base_url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green"

for year in 2019 2020; do
	for month in {01..12}; do
        # Ensure month is always two digits
        padded_month=$(printf "%02d" $month)
        # Download the file
        wget "$base_url/green_tripdata_$year-$padded_month.csv.gz"
        # Unzip the file
        gunzip "green_tripdata_$year-$padded_month.csv.gz"
        
        echo "Downloaded and unzipped: green_tripdata_$year-$padded_month.csv"
    done
done
for month in {01..07}; do
	# Ensure month is always two digits
	padded_month=$(printf "%02d" $month)
	# Download the file
	wget "$base_url/green_tripdata_2021-$padded_month.csv.gz"
	# Unzip the file
	gunzip "green_tripdata_2021-$padded_month.csv.gz"
        
	echo "Downloaded and unzipped: green_tripdata_2021-$padded_month.csv"
done


# Remove any remaining .gz files (if any failed to unzip)
find . -name "*.gz" -type f -delete

echo "All files downloaded, unzipped, and .gz files removed."
