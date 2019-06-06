from django.forms import DateTimeInput


class FengyuanChenDatePickerInput(DateTimeInput):
    template_name = 'widgets/fengyuanchen_datepicker.html'
