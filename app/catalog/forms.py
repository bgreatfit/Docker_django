import datetime
from django import forms
from django.core import validators
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError
from django.forms import SelectDateWidget
from django.utils.translation import ugettext_lazy as _

from .models import BookInstance
from .widgets import FengyuanChenDatePickerInput


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )


class RenewBookForm(forms.Form):
    renewal_date = forms.DateField(help_text="Enter a date between now and 4 weeks (default 3).",
                                   widget=FengyuanChenDatePickerInput()
                                   )

    def clean_renewal_date(self):
        data = self.cleaned_data['renewal_date']
        # check if a date is not in the past
        if data < datetime.date.today():
            raise ValidationError(_('Invalid date - renewal in past'))

        # check if a date is not allowed in the range (+ 4weeks from today)
        if data > datetime.date.today() + datetime.timedelta(weeks=4):
            raise ValidationError(_('Invalid date - renewal more than 4 weeks ahead'))

        # Remember to always return the cleaned data.
        return data


# class RenewBookModelForm(forms.ModelForm):
#
#     def _clean_fields(self):
#         data = self.cleaned_data['due_back']
#         if data and data < datetime.datetime.today():
#             raise ValidationError('')
#
#     class Meta:
#         model = BookInstance

#