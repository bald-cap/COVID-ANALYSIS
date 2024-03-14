import pandas as pd

# tempDF = pd.read_csv("temp2019.csv")

# chunkSize = 2000

# for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
#     newTuples = tempDF.iloc[chunk : chunk + chunkSize]

#     newTuples.to_csv(f"temp2019_chunk{i+1}.csv", index=False)


# tempDF = pd.read_csv("temp2020/temp2020.csv")
tempDF = pd.read_csv("covid-hospit.csv", sep=";")

chunkSize = 50000

for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
    newTuples = tempDF.iloc[chunk : chunk + chunkSize]

    newTuples.to_csv(f"covid_chunk{i+1}.csv", index=False)