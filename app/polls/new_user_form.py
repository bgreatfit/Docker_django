from django import forms
from django.core import validators
from .models import Users


class UserForm(forms.ModelForm):

    class Meta:
        model = Users
        fields = '__all__'
