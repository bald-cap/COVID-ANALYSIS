import pandas as pd
import sqlalchemy as sqlal

# tempDF = pd.read_csv("temp2019.csv")

# chunkSize = 2000

# for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
#     newTuples = tempDF.iloc[chunk : chunk + chunkSize]

#     newTuples.to_csv(f"temp2019_chunk{i+1}.csv", index=False)


# tempDF = pd.read_csv("temp2020/temp2020.csv")
tempDF = pd.read_csv("temp2021.csv")


chunkSize = 2000
connection = sqlal.create_engine('mysql+mysqlconnector://michael-kofi.nyanyui:knuMANJwJYSM2Nd1@10.10.190.39/23_2L2_michael_kofi_nyanyuie')

for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
    newTuples = tempDF.iloc[chunk : chunk + chunkSize]

    newTuples.to_csv(f"temp2021_chunk{i+1}.csv", index=False)
    newTuples.to_sql('TEMPERATURES', con=connection, if_exists='replace', index=False)