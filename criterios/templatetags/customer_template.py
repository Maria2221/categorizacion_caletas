from django import template

register = template.Library()


@register.simple_tag
def any_function(lista, idCriterio):
	index = 0

	for i in range(len(lista)):
		if lista[i][0].idCriterio.getId() == idCriterio:
			index = i
			break		

	return lista[index]


@register.simple_tag
def counting(num):
	return num+1

@register.simple_tag
def isPar(num):
	return ((num+1)%2 == 0)