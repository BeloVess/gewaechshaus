from keras.models import Sequential
from keras.layers import Dense
from keras.layers import Input
import numpy as np
import copy as cp


def Predict(model, humidity):
    print('Required:', humidity)
    openness = model.predict(humidity)
    #openness = openness.astype('int32')
    print('Predicted openness:', openness)
    return openness

model = Sequential()
model.add(Input(shape=(10,)))
model.add(Dense(32, activation='relu'))
model.add(Dense(1, activation='relu'))
model.compile(loss='mae', optimizer='adam', metrics=['mae'])

# Процент открытия затвора
Y = np.random.random([1000, 1])
# Влажность
X = np.zeros((1000, 10), dtype=int)

j = 0
for i in Y[:,0]:
    val = int(i * 10)
    X[j, val] = 1
    j =+ 1

# Влажность
#Y = cp.copy(X)

model.fit(X, Y, epochs=10, verbose=0)

#required_humidity = np.array([0.3])
#openness = 0

for i in range(1000):
    r = int(np.random.random() * 10)
    required_humidity = np.zeros([10])
    required_humidity[r] = 1
    required_humidity = required_humidity.reshape((1, 10))
    openness = Predict(model, required_humidity)
    
    #if len(np.where(openness[0] != 0)[0]) == 0:
    #    r = np.random.random()
    #    X1 = X * r
    #    Y1 = Y * r
        #model.fit(X1, Y1, epochs=10, batch_size=10, verbose=0)
    #else:
    #    pass
        #model.fit(humidity[0,:], openness, epochs=1, verbose=0)