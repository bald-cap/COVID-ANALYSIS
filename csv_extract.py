import pandas as pd

# tempDF = pd.read_csv("temp2019.csv")

# chunkSize = 2000

# for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
#     newTuples = tempDF.iloc[chunk : chunk + chunkSize]

#     newTuples.to_csv(f"temp2019_chunk{i+1}.csv", index=False)


# tempDF = pd.read_csv("temp2020/temp2020.csv")
tempDF = pd.read_csv("temp2021.csv", sep=";")

chunkSize = 2000

for i, chunk in enumerate(range(0, tempDF.shape[0], chunkSize)):
    newTuples = tempDF.iloc[chunk : chunk + chunkSize]

    newTuples.to_csv(f"temp2021_chunk{i+1}.csv", index=False)