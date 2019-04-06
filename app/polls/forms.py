from django import forms
from django.core import validators
"""
Custom Validator
"""
def check_for_z(value):
    if value[0] != 'Z':
        raise forms.ValidationError('Not equal to Z')


class Formname(forms.Form):
    name = forms.CharField(validators=[check_for_z])
    email = forms.EmailField()
    text = forms.CharField(widget=forms.Textarea)
    botcatcher = forms.CharField(widget=forms.HiddenInput,
                                 required=False,validators=[validators.MaxLengthValidator(0)])

    def clean_botcatcher(self):
        botcatcher = self.cleaned_data['botcatcher']
        if len(botcatcher) > 0:
            raise forms.ValidationError("GOTCAH BOT!")
        return botcatcher