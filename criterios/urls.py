from django.urls import re_path, include, path
from django.conf.urls import url
from . import views
from django.contrib.auth.views import LoginView
from django.contrib.auth import views as auth_views


urlpatterns = [
    re_path(r'^$', views.index, name='index'),
    re_path(r'grafica/$', views.grafica, name='grafica'), 
    re_path(r'data/', views.graficaData, name='data'), 
    
    re_path(r'resultado/categoryA/', views.resultadoA),
    re_path(r'resultado/categoryB/', views.resultadoB),
    re_path(r'resultado/categoryC/', views.resultadoC),
    re_path(r'form_eval$', views.criterios_list),
    re_path(r'prossc_eval$', views.prossc_eval),
    #botones de página principal
    re_path(r'register$', views.register),     
    re_path(r'addUsuario$', views.addUsuario, name='addUser'),
    
    #login y logout
    url( r'^login/$',auth_views.LoginView.as_view(template_name="iniciar.html"), name="login"),
    #url( r'^logout/$',auth_views.LoginView.as_view(template_name="iniciar.html"), name="logout"),
    re_path(r'logout/', views.logout_request, name="logout"),
    #olvidado password
    url(r'^',include('django.contrib.auth.urls')),
    
    #dashboard
    re_path(r'dash$', views.dash, name='dash'),
    re_path(r'^(?P<formulario_id>[0-9]+)/result_desembarco/$',views.re_desembarco, name='result_desembarco'),
    
    #result de agregar usuarios
    re_path(r'saveResult$', views.saveResult, name='save'),
    
    #resultadosxls y pdf
    re_path(r'resultadoxls$',views.re_xls),
    re_path(r'^reporte_formularios/$', views.ReporteFormulariosExcel.as_view(), name="reporte_formularios"),
    url(r'^upload/csv/$', views.upload_csv, name='upload_csv'),
  #  re_path(r'^ingresoBarco/$', views.ReporteFormulariosExcel.as_view(), name="ingresoBarco"),
    re_path(r'^csv/ingresoCSV/$', views.getBarcosParaCSV, name="ingresoCSV"),
 #   re_path(r'^reporte_formularios/$', views.ReporteFormulariosExcel.as_view(), name="reporte_formularios"),

    url(r'^vistaBarco$', views.getVistaCSV),

    url(r'^documentos/(?P<path>.*)$', views.downloadCSV),
    re_path(r'^reporte_formularios_pdf/(?P<formulario_id>[0-9]+)/$', views.ReporteFormulariosPDF.as_view(), name="reporte_formularios_pdf"),
    re_path(r'^reporte_grafica_pdf/$', views.ReporteGraficasPDF.as_view(), name="reporte_grafica"),    
    # url(r'^generate/pdf/$', views.generate_pdf, name='generate_pdf'),
]