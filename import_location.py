import mysql.connector

# ✅ Connect to MySQL (update your password below)
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='your_password',  # <-- change this
    database='uber_fhv_data',
    allow_local_infile=True
)

cursor = conn.cursor()

try:
    # ✅ Create the location table if it doesn't exist
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS location (
            LocationID INT PRIMARY KEY,
            Borough VARCHAR(50),
            Zone VARCHAR(100)
        );
    """)

    # ✅ Use raw string for safe file path (prevents \t and \U errors)
    file_path = r'C:\Users\Michael\Downloads\taxi-zone-lookup.csv'

    # ✅ Load the CSV data
    cursor.execute(f"""
        LOAD DATA LOCAL INFILE '{file_path}'
        INTO TABLE location
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS
        (LocationID, Borough, Zone);
    """)

    conn.commit()

    # ✅ Show how many rows were loaded
    cursor.execute("SELECT COUNT(*) FROM location;")
    print("✅ Rows loaded:", cursor.fetchone()[0])

except mysql.connector.Error as err:
    print("❌ MySQL Error:", err)

finally:
    cursor.close()
    conn.close()
