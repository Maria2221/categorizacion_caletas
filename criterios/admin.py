from django.contrib import admin
from .models import Criterio, Condicion, Usuario, Formulario

admin.site.register(Criterio)
admin.site.register(Condicion)


class FormularioInline(admin.TabularInline):
	model = Formulario
	extra = 2

class UsuarioAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['usuario']}),
    ]
    inlines = [FormularioInline]

    list_display = ('nombre', 'usuario', 'password', 'dni')
    search_fields = ['usuario']

admin.site.register(Usuario, UsuarioAdmin)