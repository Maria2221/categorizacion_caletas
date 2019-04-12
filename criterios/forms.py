from django import forms

class RegistrationForm(forms.Form):
	nombre = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Nombre'}))

	apellido = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Apellido'}))

	usuario = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Usuario'}))

	dni = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Dni'}))

	correo = forms.CharField(max_length=100,
							widget=forms.EmailInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Correo'}))

	password = forms.CharField(max_length=100,
							widget=forms.PasswordInput(attrs={'id': 'password_input','class': 'password_input',
														'placeholder': 'Contraseña'}))

	instituto = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username-input','class': 'username-input',
														'placeholder': 'Institución'}))	

class LoginForm(forms.Form):
	usuario = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id':'username_input','class':'username-input',
														'placeholder':'Usuario'}))
	contra = forms.CharField(max_length=100,
							widget=forms.PasswordInput(attrs={'id': 'password_input','class': 'password_input',
														'placeholder': 'Contraseña'}))

class ResultForm(forms.Form):
	nombreFormulario = forms.CharField(max_length=100,
							widget=forms.TextInput(attrs={'id': 'username_input','class':'username-input',
														'placeholder':'Nombre'}))
		
