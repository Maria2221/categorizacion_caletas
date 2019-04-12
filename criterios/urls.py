from django.urls import re_path, include, path
from django.conf.urls import url
from . import views
from django.contrib.auth.views import LoginView
from django.contrib.auth import views as auth_views


urlpatterns = [
    re_path(r'^$', views.index),
    re_path(r'resultado/categoryA/', views.resultadoA),
    re_path(r'resultado/categoryB/', views.resultadoB),
    re_path(r'resultado/categoryC/', views.resultadoC),
    re_path(r'resultado/categoryD/', views.resultadoD),
    re_path(r'form_eval$', views.criterios_list),
    re_path(r'prossc_eval$', views.prossc_eval),
    #botones de página principal 
    re_path(r'register$', views.register),     
    re_path(r'addUsuario$', views.addUsuario, name='addUser'),
    #login
    url( r'^login/$',auth_views.LoginView.as_view(template_name="iniciar.html"), name="login"),    
    #dashboard
    re_path(r'dash$', views.dash),
    re_path(r'^(?P<formulario_id>[1-9]+)/result_desembarco/$',views.re_desembarco, name='result_desembarco'),
    #result
    re_path(r'saveResult$', views.saveResult, name='save'),
    #resultadosxls
    re_path(r'resultadoxls$',views.re_xls),
    re_path(r'^reporte_formularios/$', views.ReporteFormulariosExcel.as_view(), name="reporte_formularios"),
    re_path(r'^reporte_formularios_pdf/(?P<formulario_id>[1-9]+)/$', views.ReporteFormulariosPDF.as_view(), name="reporte_formularios_pdf"),
    # url(r'^generate/pdf/$', views.generate_pdf, name='generate_pdf'),
]