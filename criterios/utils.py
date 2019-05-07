from sklearn.cluster import DBSCAN
from sklearn import metrics

from sklearn import datasets, linear_model
from sklearn.metrics import mean_squared_error, r2_score
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d
import sklearn.linear_model
from matplotlib.pylab import hist, show
from sklearn.cluster import KMeans
from sklearn.datasets import make_blobs
import math
from sklearn.linear_model import LinearRegression
import pandas as pd


# evenly sampled time at 200ms intervals
# t = np.arange(0., 5., 0.2)
def procesar(archivoNombre):

    # data = np.genfromtxt(origen+'databarcos.csv', skip_header=1 ,delimiter=',', usecols=(0, 5, 6, 7,14), dtype=None, names=['no','es','ma','pu','bo'])
    data = np.genfromtxt(archivoNombre, skip_header=1, delimiter=',', usecols=(0, 5, 6, 7, 14, 22),
                         dtype=None, names=['no', 'es', 'ma', 'pu', 'bo', 'ar'])
    initlen = len(data)
    print('Embarcaciones en excel')
    print(initlen)

    print('Redondeando a 2 decimales...')

    data['es'] = ["{:0.2f}".format(x) for x in data['es']]
    data['ma'] = ["{:0.2f}".format(x) for x in data['ma']]
    data['pu'] = ["{:0.2f}".format(x) for x in data['pu']]
    # print(data['es'].shape)

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
    print(initlen - len(data))
    eliminados1 = initlen - len(data)
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
    print(newlen - len(data))
    eliminados2 =newlen - len(data)

    newlen = len(data)
    print('Eliminando embarcaciones sin puntal...')
    i = 0
    a = []
    for x in np.nditer(data['pu']):
        if x == 0 or x > 10:
            a = np.append(a, i)
        i += 1
    data = np.delete(data, a, axis=0)
    data = data[np.isfinite(data['pu'])]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminados3 =newlen - len(data)
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
    print(newlen - len(data))
    eliminados4 =newlen - len(data)
    eliminadosLogica = eliminados1+eliminados2+eliminados3+eliminados4
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
    print(newlen - len(data))
    eliminadosEsloraManga = newlen - len(data)
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
    print(newlen - len(data))
    eliminadosNoArtesanales =newlen - len(data)
    newlen = len(data)

    print('Eliminando embarcaciones con relaciones no validas...')
    i = 0
    a = []
    for x in np.nditer(data):
        if x['es'] > 30 * x['pu'] or x['ma'] > 6 * x['pu'] or x['es'] > 5 * x['ma']:
            a = np.append(a, i)
        i += 1
    data = np.delete(data, a, axis=0)
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosPaper = newlen - len(data)
    newlen = len(data)

    print('Aplicando regresion lineal')
    x = data['es']
    y = data['ma']

    model = LinearRegression(fit_intercept=True)

    model.fit(x[:, np.newaxis], y)

    xfit = x
    yfit = model.predict(xfit[:, np.newaxis])

    # plt.scatter(x, y, color='k', marker='.')
    # plt.plot(xfit, yfit, c='r')
    # plt.xlabel('Eslora')
    # plt.ylabel('Manga')
    # plt.show()

    ar = model.coef_[0]
    br = model.intercept_

    print('Eliminando embarcaciones de la regresion...')
    i = 0
    a = []
    for x in np.nditer(data):
        if abs(ar * x['es'] - x['ma'] + br) / math.sqrt(ar ** 2 + 1) > 3:
            a = np.append(a, i)
        i += 1
    data = np.delete(data, a, axis=0)
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosRegresion =newlen - len(data)
    newlen = len(data)
    #eliminados = [eliminados1,eliminados2,eliminados3,eliminados4,eliminados5,eliminados6,eliminados7,eliminados8]
    print('Total de embarcaciones eliminadas')
    eliminadosFinal =initlen - newlen
    print(initlen - newlen)
    print('Total de embarcaciones usadas')
    print(newlen)
    total =newlen

    print('Total de embarcaciones usadas')
    print(newlen)

#    s =
    x = data['es']
    y = data['bo']
    frequencies = [eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper]

    freq_series = pd.Series(frequencies)

    y_labels = ['condición 1','condición 2','condición 3','condición 4']

    plt.figure(figsize=(12, 8))
    ax = freq_series.plot(kind='barh')
    ax.set_title('Amount Frequency')
    ax.set_xlabel('Embarcaciones eliminadas')
    ax.set_ylabel('Condiciones')
    ax.set_yticklabels(y_labels)
    ax.set_xlim(-40, 300)  # expand xlim to make labels easier to read

    rects = ax.patches

    # For each bar: Place a label
    for rect in rects:
        # Get X and Y placement of label from rect.
        x_value = rect.get_width()
        y_value = rect.get_y() + rect.get_height() / 2

        # Number of points between bar and label. Change to your liking.
        space = 5
        # Vertical alignment for positive values
        ha = 'left'

        # If value of bar is negative: Place label left of bar
        if x_value < 0:
            # Invert space to place label to the left
            space *= -1
            # Horizontally align label at right
    plt.savefig("static/img/histogramaEliminados.png")
    x = x.tolist()
    y = y.tolist()

    # 1- mas bajo
    # 0- mas alto
    # 2 - segundo mas bajo
    # 3-

  #  arreglo = np.zeros(4)

   # paises = ("grupo1", "grupo2", "grupo3", "grupo4",)
   # posicion_y = np.arange(len(paises))

    #histo = plt.barh(posicion_y, arreglo, align="center")
    #histo[3].set_color('#F0E90F')
    #histo[2].set_color('#32688C')

    #histo[1].set_color('#33B577')

    #histo[0].set_color('#7E5E83')

    #plt.yticks(posicion_y, paises)
    plt.xlabel('Eslora m')
    plt.ylabel('Capacidad de bodega m3')

    plt.title("V")
    # Make fake dataset
    height = [1.09,2.17,10.87, 32.6]
    colors = (0, 0, 0)
    area = np.pi * 4
    bars = ('grupo1', 'grupo2', 'grupo3', 'grupo4' )

    # Choose the position of each barplots on the x-axis (space=1,4,3,1)
    y_pos = [1.5, 2.5, 6, 12]
    color1 = (0, 0, 0, 0.2)
    color2 = (0, 0, 0, 0.2)

    color3 = (0.4, 0, 0, 0.2)
    color4 = (0, 0.6, 0, 0.2)


    # Create bars
    barList = plt.bar(y_pos, height, width=[1,1,6,6])
    barList[0].set_color(color1)
    barList[1].set_color(color2)
    barList[2].set_color(color3)
    barList[3].set_color(color4)


    plt.scatter(x, y, s=area, c=colors)

    # Create names on the x-axis
   # plt.xticks(y_pos, bars)
    plt.savefig("static/img/histograma.png")
    return eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper,eliminadosRegresion, total,x,y
def procesar2(archivoNombre):
    data = pd.read_csv(archivoNombre, delimiter=',')
    # data = np.genfromtxt(origen+'databarcos.csv', skip_header=1 ,delimiter=',', usecols=(0, 5, 6, 7,14), dtype=None, names=['no','es','ma','pu','bo'])

    initlen = len(data)
    print('Embarcaciones en excel')
    print(initlen)

    print('Redondeando a 2 decimales...')

    # print(data['es'].shape)

    print('Eliminando embarcaciones sin eslora...')
    data = data.dropna(thresh=5)
    data = data[data.ESLORA > 0]
    print(initlen - len(data))
    eliminados1 = initlen - len(data)
    newlen = len(data)

    print('Eliminando embarcaciones sin manga...')
    data = data.dropna(thresh=6)
    data = data[data.MANGA > 0]

    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminados2 = newlen - len(data)

    newlen = len(data)
    print('Eliminando embarcaciones sin puntal...')
    data = data.dropna(thresh=7)
    data = data[data.PUNTAL > 0]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminados3 = newlen - len(data)
    newlen = len(data)

    print('Eliminando embarcaciones sin capacidad de bodega en M3...')
    data = data.dropna(thresh=14)
    data = data[data.CAPBOD_M3 > 0]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminados4 = newlen - len(data)
    eliminadosLogica = eliminados1 + eliminados2 + eliminados3 + eliminados4
    newlen = len(data)

    print('Eliminando embarcaciones con manga mayor a eslora...')

    data = data[data.ESLORA > data.MANGA]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosEsloraManga = newlen - len(data)
    newlen = len(data)

    print('Eliminando embarcaciones con capacidad de bodega mayor a 32.5 y eslora mayor a 15...')
    data = data[data.CAPBOD_M3 <= 32.6]
    data = data[data.ESLORA <= 18]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosNoArtesanales = newlen - len(data)
    newlen = len(data)

    print('Eliminando embarcaciones con relaciones no validas...')
    data = data[data.MANGA <= 6 * data.PUNTAL]
    data = data[data.ESLORA <= 5 * data.MANGA]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosPaper = newlen - len(data)
    newlen = len(data)

    print('Aplicando regresion lineal')
    x = data['ESLORA']
    y = data['MANGA']

    model = LinearRegression(fit_intercept=True)

    model.fit(x[:, np.newaxis], y)

    xfit = x
    yfit = model.predict(xfit[:, np.newaxis])

    # plt.scatter(x, y, color='k', marker='.')
    # plt.plot(xfit, yfit, c='r')
    # plt.xlabel('Eslora')
    # plt.ylabel('Manga')
    # plt.show()

    ar = model.coef_[0]
    br = model.intercept_

    print('Eliminando embarcaciones de la regresion...')
    data = data[(ar * data.ESLORA - data.MANGA + br) / math.sqrt(ar ** 2 + 1) <= 3]
    print('Embarcaciones eliminadas')
    print(newlen - len(data))
    eliminadosRegresion = newlen - len(data)
    newlen = len(data)
    # eliminados = [eliminados1,eliminados2,eliminados3,eliminados4,eliminados5,eliminados6,eliminados7,eliminados8]
    print('Total de embarcaciones eliminadas')
    eliminadosFinal = initlen - newlen
    print(initlen - newlen)

    print('Total de embarcaciones usadas')
    print(newlen)
    total = newlen

    print('Total de embarcaciones usadas')
    print(newlen)
    #    s =
    x = data['ESLORA']
    y = data['CAPBOD_M3']
    frequencies = [eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper]

    freq_series = pd.Series(frequencies)

    y_labels = ['condición 1','condición 2','condición 3','condición 4']

    plt.figure(figsize=(8, 6))
    ax = freq_series.plot(kind='barh')
    ax.set_title('Grafico Barras')
    ax.set_xlabel('Embarcaciones eliminadas')
    ax.set_yticklabels(y_labels)
    #ax.set_xlim(-40, 300)  # expand xlim to make labels easier to read

    rects = ax.patches

    # For each bar: Place a label
    for rect in rects:
        # Get X and Y placement of label from rect.
        x_value = rect.get_width()
        y_value = rect.get_y() + rect.get_height() / 2

        # Number of points between bar and label. Change to your liking.
        space = 5
        # Vertical alignment for positive values
        ha = 'left'

        # If value of bar is negative: Place label left of bar
        if x_value < 0:
            # Invert space to place label to the left
            space *= -1
            # Horizontally align label at right
    plt.savefig("static/img/histogramaEliminados.png")

    x = x.tolist()
    y = y.tolist()

    # 1- mas bajo
    # 0- mas alto
    # 2 - segundo mas bajo
    # 3-

    #  arreglo = np.zeros(4)

    # paises = ("grupo1", "grupo2", "grupo3", "grupo4",)
    # posicion_y = np.arange(len(paises))

    # histo = plt.barh(posicion_y, arreglo, align="center")
    # histo[3].set_color('#F0E90F')
    # histo[2].set_color('#32688C')

    # histo[1].set_color('#33B577')

    # histo[0].set_color('#7E5E83')
    plt.figure(figsize=(8, 6))
    # plt.yticks(posicion_y, paises)
    plt.xlabel('Eslora(metros)')
    plt.ylabel('Capacidad de Bodega (metros Cubicos)')

    plt.title("Grafica")
    # Make fake dataset
    height = [1.09, 2.17, 10.87, 32.6]
    colors = (0, 0, 0)
    plt.xticks(range(1, 19))
    plt.yticks(range(1, 33))
    area = np.pi * 2
    bars = ('grupo1', 'grupo2', 'grupo3', 'grupo4')
    xlinea = np.linspace(1, 18)
    ylinea = xlinea *0+32.6
    plt.plot(xlinea, ylinea,'--')
    # Choose the position of each barplots on the x-axis (space=1,4,3,1)
    y_pos = [1.5, 2.5, 6, 13.5]
    color1 = (0, 0, 0.2, 0.2)
    color2 = (0, 0, 0, 0.2)

    color3 = (0.4, 0, 0, 0.2)
    color4 = (0, 0.6, 0, 0.2)

    # Create bars
    barList = plt.bar(y_pos, height, width=[1, 1, 6, 9])
    barList[0].set_color(color1)
    barList[1].set_color(color2)
    barList[2].set_color(color3)
    barList[3].set_color(color4)

    plt.scatter(x, y, s=area, c=colors)

    # Create names on the x-axis
    # plt.xticks(y_pos, bars)
    # plt.savefig("static/img/histograma.png")
    # return eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper,eliminadosRegresion, total,x,y,

    # Create names on the x-axis
   # plt.xticks(y_pos, bars)
    plt.savefig("static/img/histograma.png")
    data1 = data[data.ESLORA <= 2 ]
    data1 = data1[data1.CAPBOD_M3 <=1.09]
    data2 = data[data.ESLORA <= 3]
    data2 = data2[data2.ESLORA >2 ]
    data2 = data2[data2.CAPBOD_M3 <= 2.17]
    data3 = data[data.ESLORA <= 9]
    data3 = data3[data3.ESLORA > 3]
    data3 = data3[data3.CAPBOD_M3 <= 10.87]
    data4 = data[data.ESLORA <= 18]
    data4 = data4[data4.ESLORA > 9]
    data4 = data4[data4.CAPBOD_M3 <= 32.6]
    l1=len(data1.index)
    l2=len(data2.index)
    l3=len(data3.index)
    l4=len(data4.index)
    l5 = newlen -l1-l2-l3-l4

    return eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper,eliminadosRegresion, total,data,l1,l2,l3,l4,l5
