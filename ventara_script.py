# -*- coding: utf-8 -*-
"""
Created on Sat Mar 28 20:47:41 2020
"""
import csv
import psycopg2

my_db = 'db'
my_host = 'host'
my_port = '5000'
my_user = 'user'
my_password = 'password'

file_path = "C:\\Users\\Desktop\\Ventara\\python_test.csv"

# Create target(TEST_MSR_TARGET) redshift table 
con = psycopg2.connect(dbname=my_db,host=my_host,port=my_port,user=my_user,password=my_password)
cur = con.cursor()
cur.execute("""CREATE TABLE TEST_MSR_TARGET(
  TEST_MSR_TARGET_ID int4 identity(1,1),
  rpt_grp_cd varchar(60),
  lctn_typ_cd varchar(10),
  clctn_prd_txt varchar(8),
  msr_cd varchar(20),
  clcltn_date date,
  grp_rate_nmrtr int4,
  grp_rate_dnmntr numeric(5),
  file_name varchar(50),
  finl_sw varchar(1),
  creat_ts timestamp NOT NULL,
  creat_user_id varchar(30) NOT NULL,
  submsn_cmplt_cd varchar(1)
""")
con.commit()

# insert data from csv file into "TEST_MSR_TARGET" table
with open(file_path, 'r') as f:
    reader = csv.reader(f)
    next(reader) # Skip the header row
    for row in reader:
        cur.execute(
                "INSERT INTO TEST_MSR_TARGET VALUES (%s, %s, %s, %s, %s, %d, %.5f, %s, %s, %s, %s, %s)" 
                %(row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10],row[11],row[12]))
con.commit()
cur.close()
con.close()
