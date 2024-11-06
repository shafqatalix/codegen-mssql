
import pyodbc

def generate(connectionstring,target):
    print(f"This should generate code for connectionString:{connectionstring}, target language:{target}, ")
    conn=pyodbc.connect(connectionstring)
    cursor = conn.cursor()
    cursor.execute("Select RecoveryID,LeaseDealID from dbo.Recovery")
    records = cursor.fetchall()
    for r in records:
        print(f"{r.RecoveryID}\t{r.LeaseDealID}")