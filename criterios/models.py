from django.db import models

from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from math import floor



#VALIDADORES
def MaxValueValidator(value):
    if value > 100:
        raise ValidationError(
            _('%(value)s is not valid'),
            params={'value': value},
        )

def MinValueValidator(value):
    if value < 1:
        raise ValidationError(
            _('%(value)s is not valid'),
            params={'value': value},
        )


def roundDecimal(number, decs):    

    xmay = number*(10**(decs+1))
    xmen = number*(10**(decs))
    xmay = floor(xmay)
    xmen = floor(xmen)*10

    num_eval = xmay-xmen
    if num_eval <= 0:
        return round(number,4)

    inc = 0

    trunk_number = floor(number*(10**(decs)))
    trunk_number = trunk_number/(10**(decs))   

    if num_eval >=  5:
        inc = 1/(10**(decs))
        trunk_number = inc+trunk_number
    
    return round(trunk_number,4)


#Criterios
class Criterio(models.Model):


    idCriterio = models.AutoField(primary_key=True)
    idCriterioPadre = models.ForeignKey('self' , blank=True, null=True, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=200)
    children = models.IntegerField(default=0)

    porcentaje = models.IntegerField(
        default = 1,
        validators=[MaxValueValidator, MinValueValidator]
    )

    nivel = models.IntegerField(
        default = 0
    )

    multipleOptions = models.BooleanField( default=False)

  
    def getStr(self):
        return self.nombre

    def setChildren(self, children):
        self.children = children

    def getId(self):
        return self.idCriterio
        
    def getPorcentaje(self):
        return self.porcentaje

    def getNivel(self):
        return self.nivel

    def __init__(self, *args, **kwargs):
        super(Criterio, self).__init__(*args, **kwargs)
        if self.idCriterioPadre is not None:
            if self.nivel == 0:
                item = Criterio.objects.get(pk=self.idCriterioPadre.pk)
                self.nivel = item.nivel + 1




#Condiciones
class Condicion(models.Model):
    idCondicion = models.AutoField(primary_key=True)
    idCriterio = models.ForeignKey(Criterio, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=200)
    porcentaje = models.IntegerField(
        default = 1,
        validators=[MaxValueValidator, MinValueValidator]
    )
    isSelected  = models.BooleanField(default=False)
    ponderado = models.DecimalField(
        default = 0.0,
        max_digits=5,
        decimal_places=4
    )

    def __str__(self):
        return self.nombre

    def getPorcentaje(self):
        return self.porcentaje

    def getPonderado(self):
        return self.ponderado

    def __init__(self, *args, **kwargs):
        super(Condicion, self).__init__(*args, **kwargs)
        if self.ponderado == 0.0:

            temp_pond = self.porcentaje
            crit1 = Criterio.objects.get(idCriterio=self.idCriterio.getId())
            div = 100**(crit1.getNivel()+2)

            while True:
                temp_pond *= crit1.getPorcentaje()
                if crit1.idCriterioPadre is None:
                    break
                crit2 = Criterio.objects.get(idCriterio=crit1.idCriterioPadre.pk)
                crit1 = crit2

            total = temp_pond/div
            
            self.ponderado = roundDecimal(total,4)


class Usuario(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    usuario = models.CharField(max_length=100)
    dni = models.CharField(max_length=8)
    correo = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    instituto = models.CharField(max_length=100)  
    user =  models.OneToOneField(User,on_delete=models.CASCADE)

    def __str__(self):
         return self.usuario

           
class Formulario(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, blank=True, null=True)
    idFormulario = models.AutoField(primary_key=True)
    nombreFormulario = models.CharField(max_length=100)
    tipo = models.CharField(max_length=50)
    nivel = models.CharField(max_length=50)
    ponderado = models.CharField(max_length=5,blank=True,null=True)
    condiciones = models.CharField(max_length=100,blank=True,null=True)

    def __str__(self):
         return self.nombreFormulario


class CSV(models.Model):
    idCSV = models.AutoField(primary_key=True)

    nombreArchivo = models.CharField(max_length=50)
    eliminados1 = models.IntegerField(default=0)
    eliminados2 = models.IntegerField(default=0)
    eliminados3 = models.IntegerField(default=0)
    eliminados4 = models.IntegerField(default=0)

    def __str__(self):
         return str("{:10.4f}".format(self.eslora))+str("{:10.4f}".format(self.manga))+str("{:10.4f}".format(self.puntal))




class Barco(models.Model):
    matricula = models.CharField(max_length=50)
    csv = models.ForeignKey(CSV, on_delete=models.CASCADE, blank=True, null=True)

    casco = models.CharField(max_length=50)
    regimen =  models.CharField(max_length=50)
    tipo =  models.CharField(max_length=50)
    eslora  =  models.DecimalField(max_digits=5, decimal_places=2)
    manga  =models.DecimalField(max_digits=5, decimal_places=2)
    puntal =models.DecimalField(max_digits=5, decimal_places=2)
#    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
         return str("{:10.4f}".format(self.eslora))+str("{:10.4f}".format(self.manga))+str("{:10.4f}".format(self.puntal))

