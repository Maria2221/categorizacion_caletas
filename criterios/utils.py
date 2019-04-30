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

    x = data['es']
    y = data['bo']

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
    plt.xlabel('eslora m')
    plt.ylabel('Capacidad de bodega m3')

    plt.title("Ventas en Europa")
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

    # Show graphic
#    plt.show()
    return eliminadosLogica,eliminadosEsloraManga,eliminadosNoArtesanales,eliminadosPaper,eliminadosRegresion, total,x,y
 #  X = np.stack((x, y), axis=-1)

    # #############################################################################
    # Compute DBSCAN
    """
    db = DBSCAN(eps=4, min_samples=25).fit(X)
    core_samples_mask = np.zeros_like(db.labels_, dtype=bool)
    core_samples_mask[db.core_sample_indices_] = True
    labels = db.labels_

    # Number of clusters in labels, ignoring noise if present.
    n_clusters_ = len(set(labels)) - (1 if -1 in labels else 0)
    """

    # #############################################################################
    # Plot result

    """
    # Split the data into training/testing sets
    diabetes_X_train = x
    diabetes_X_test = x

    # Split the targets into training/testing sets
    diabetes_y_train = y
    diabetes_y_test = y

    # Create linear regression object
    regr = linear_model.LinearRegression()

    # Train the model using the training sets
    regr.fit(diabetes_X_train, diabetes_y_train)

    # Make predictions using the testing set
    diabetes_y_pred = regr.predict(diabetes_X_test)

    a = regr.coef_
    b = regr.intercept_

    # The coefficients
    print('Coeficientes: \n', regr.coef_)
    # The mean squared error
    print("Mean squared error: %.2f"
          % mean_squared_error(diabetes_y_test, diabetes_y_pred))
    # Explained variance score: 1 is perfect prediction
    print('Variance score: %.2f' % r2_score(diabetes_y_test, diabetes_y_pred))

    # Plot outputs
    plt.scatter(diabetes_X_test, diabetes_y_test,  color='black')
    plt.plot(diabetes_X_test, diabetes_y_pred, color='blue', linewidth=3)

    plt.xticks(())
    plt.yticks(())

    plt.show()
    """

