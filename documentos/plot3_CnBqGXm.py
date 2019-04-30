import numpy as np
import matplotlib.pyplot as plt
import math


# evenly sampled time at 200ms intervals
# t = np.arange(0., 5., 0.2)

data = np.genfromtxt('databarcos.csv', skip_header=1 ,delimiter=',', usecols=(0, 5, 6, 7, 14, 22), dtype=None, names=['no','es','ma','pu','bo', 'ar'])
initlen = len(data)
print('Embarcaciones en excel')
print(initlen)

print('Redondeando a 2 decimales...')

data['es'] = [ "{:0.2f}".format(x) for x in data['es'] ]
data['ma'] = [ "{:0.2f}".format(x) for x in data['ma'] ]
data['pu'] = [ "{:0.2f}".format(x) for x in data['pu'] ]
#print(data['es'].shape)

print('Eliminando embarcaciones sin eslora...')
i = 0
a = []
for x in np.nditer(data['es']):
   if x == 0:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
data = data[np.isfinite(data['es'])]
print('Embarcaciones eliminadas')
print(initlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones sin manga...')
i = 0
a = []
for x in np.nditer(data['ma']):
   if x == 0:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
data = data[np.isfinite(data['ma'])]
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones sin puntal...')
i = 0
a = []
for x in np.nditer(data['pu']):
   if x == 0:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
data = data[np.isfinite(data['pu'])]
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones sin capacidad de bodega en M3...')
i = 0
a = []
for x in np.nditer(data['bo']):
   if x == 0:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
data = data[np.isfinite(data['bo'])]
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones con manga mayor a eslora...')
i = 0
a = []
for x in np.nditer(data):
   if x['es'] < x['ma']:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones con capacidad de bodega mayor a 32.5 y eslora mayor a 15...')
i = 0
a = []
for x in np.nditer(data):
   if x['bo'] > 32.6 or x['es'] > 15:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Eliminando embarcaciones con relaciones no validas...')
i = 0
a = []
for x in np.nditer(data):
   if x['es'] > 30*x['pu'] or x['ma'] > 6*x['pu'] or x['es'] > 5*x['ma']:
      a = np.append(a, i)
   i += 1
data = np.delete(data, a, axis=0)
print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Aplicando regresion lineal')
x = data['es']
y = data['ma']

print('Eliminando embarcaciones de la regresion...')

print('Embarcaciones eliminadas')
print(newlen-len(data))
newlen = len(data)

print('Total de embarcaciones eliminadas')
print(initlen-newlen)

print('Total de embarcaciones usadas')
print(newlen)

artpesca = 'VARIOS'
print plt.get_backend()

print('Total de embarcaciones usadas')
print(newlen)
arreglo = [0,0,0,0]
for i1 in  range(0,len(x)) :

      if x[i1]> 0 and  x[i1] <= 2 and  y[i1] < 1:
         arreglo[0]= arreglo[0]+1;
      if x[i1] > 2 and x[i1] <= 3 and  y[i1] < 2:
         arreglo[1]= arreglo[1]+1;
      if x[i1] > 3 and x[i1] <= 9 and  y[i1] < 11:
         arreglo[2]= arreglo[2]+1;
      if x[i1] > 9 and x[i1] <= 15 and  y[i1] < 33:
         arreglo[3]= arreglo[3]+1;
print ("categoria 1 "+str(arreglo[0])+" \n")
print ("categoria 2 "+str(arreglo[1])+" \n")
print ("categoria 3 "+str(arreglo[2])+" \n")
print ("categoria 4 "+str(arreglo[3])+" \n")
  	


