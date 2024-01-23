### Show all data 
SELECT * 
FROM PropertyRecords;

### Update the Date Format. 
SELECT SaleDate, STR_TO_DATE(SaleDate, '%M %d, %Y') AS SaleDateConverted 
-- to convert a date in MSSQL, you can just use "CONVERT(DATE, SaleDate)"
FROM PropertyRecords;

SET SQL_SAFE_UPDATES = 0; -- used to turn off safe updates for the table. 
UPDATE PropertyRecords 
SET SaleDate = STR_TO_DATE(SaleDate, '%M %d, %Y');

### Populate Property Address Data
SELECT UniqueID, OwnerName, PropertyAddress
FROM PropertyRecords 
WHERE PropertyAddress is NULL;

-- If there's same parcelid but the other pair is not having address, give the same address. 
SELECT 
	t1.ParcelId, 
	t1.PropertyAddress,
    t2.ParcelId, 
	t2.PropertyAddress
    -- IFNULL(t1.PropertyAddress, t2.PropertyAddress) AS supposedSolution #just another way of passing value to null field. 
FROM 
	PropertyRecords t1
    JOIN
    PropertyRecords t2 
    ON 
		t1.ParcelID = T2.ParcelID 
        AND 
        t1.UniqueID <> t2.UniqueID
WHERE t1.PropertyAddress is NULL;

-- Now updating the property addresses of the PropertyRecords 
UPDATE 
	PropertyRecords t1 
	JOIN
    PropertyRecords t2 
    ON 
		t1.ParcelID = T2.ParcelID 
        AND 
        t1.UniqueID <> t2.UniqueID	
SET t1.PropertyAddress = t2.PropertyAddress
WHERE t1.PropertyAddress is NULL;

### Breaking out Address into individual columns (Address, City, State)

# address with number 
SELECT SUBSTRING_INDEX(PropertyAddress, ',', 1) AS testAddress 
FROM PropertyRecords;

-- to get the state:
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(PropertyAddress, ', ', -1), ' ', 1) AS state
FROM PropertyRecords;

-- To get the number address:
SELECT SUBSTRING_INDEX(PropertyAddress, ' ', 1) AS state
FROM PropertyRecords;

-- To get the city: 
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(PropertyAddress, ', ', 1), ' ', -3)) AS street_name
FROM PropertyRecords;

# We are only going to use the address with number and the city or the state. 
ALTER TABLE PropertyRecords
ADD COLUMN PropertySplitAddress text, 
ADD COLUMN PropertySplitCity text;

UPDATE PropertyRecords
SET PropertySplitAddress = SUBSTRING_INDEX(PropertyAddress, ',', 1), 
	PropertySplitCity = SUBSTRING_INDEX(SUBSTRING_INDEX(PropertyAddress, ', ', -1), ' ', 1);

# We are also going cut out the address of the owner and cut it by three (address, city, state):
SELECT 
	OwnerAddress,
	SUBSTRING_INDEX(OwnerAddress, ',', 1) AS wan,
    SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', -2), ',', 1) AS tu,
    SUBSTRING_INDEX(OwnerAddress, ',', -1) AS tri
FROM PropertyRecords;

ALTER TABLE PropertyRecords
ADD COLUMN OwnerSplitAddress text, 
ADD COLUMN OwnerSplitCity text,
ADD COLUMN OwnerSplitState text;

UPDATE PropertyRecords 
SET 
	OwnerSplitAddress = SUBSTRING_INDEX(OwnerAddress, ',', 1),
	OwnerSplitCity = SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', -2), ',', 1),
	OwnerSplitState = SUBSTRING_INDEX(OwnerAddress, ',', -1);

### Change Y and N to Yes and No in "Sold as Vacant" field: 
SELECT SoldAsVacant, COUNT(SoldAsVacant)
FROM PropertyRecords
GROUP BY SoldAsVacant;

UPDATE PropertyRecords 
SET SoldAsVacant = 'Yes'
WHERE SoldAsVacant = 'Y';

UPDATE PropertyRecords 
SET SoldAsVacant = 'No'
WHERE SoldAsVacant = 'N';

### Removing Duplicates 

WITH ROW_NUM_CTE AS (
	SELECT 
		*,
		ROW_NUMBER() OVER(
			PARTITION BY
				ParcelID,
				PropertyAddress, 
				SalePrice, 
				SaleDate, 
				LegalReference
			ORDER BY 
				UniqueID
		) AS row_num
	FROM 
		PropertyRecords
)

SELECT *
FROM 
	ROW_NUM_CTE
WHERE 
	row_num > 1
ORDER BY 
	PropertyAddress;
    
# To actually delete duplicates with the help of CTE. 
DELETE 
	p1
FROM 
	PropertyRecords p1
	JOIN (
		SELECT 
			ParcelID,
			PropertyAddress, 
			SalePrice, 
			SaleDate, 
			LegalReference,
			MIN(UniqueID) AS minUniqueID
		FROM PropertyRecords
		GROUP BY
			ParcelID,
			PropertyAddress, 
			SalePrice, 
			SaleDate, 
			LegalReference
		HAVING COUNT(*) > 1
	) p2 ON p1.ParcelID = p2.ParcelID
		AND p1.PropertyAddress = p2.PropertyAddress
		AND p1.SalePrice = p2.SalePrice
		AND p1.SaleDate = p2.SaleDate
		AND p1.LegalReference = p2.LegalReference
		AND p1.UniqueID > p2.minUniqueID;

### Deleting NULL/Unused Columns. 

ALTER TABLE PropertyRecords 
DROP COLUMN PropertyAddress,
DROP COLUMN OwnerAddress;



/*
	Date format was standardized in the SQL. 
    Property Address was populated to same owner. 
	Owner Address and their property address then get separated and have their own fields (address, city, state)
    Fixed response to the field "SoldAsVacant"
    And finally, removing duplicates. 
    
    -- NOTE -- 
    There were NULL values that were not removed because that indicates that a record may not be owned by someone. 
*/







	
