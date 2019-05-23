from django.shortcuts import render,redirect,reverse,HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.views.generic import CreateView
from django import urls


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form = form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password')
            user = authenticate(request,username=username, password=raw_password)
            login(request, user)
    else:
        form = UserCreationForm()

    return render(request,'first_project/signup.html',{'form':form})


class Register(CreateView):
    template_name = 'first_project/form.html'
    form_class = UserCreationForm
    success_url = urls.reverse_lazy('home')

    def form_valid(self, *args, **kwargs):
        resp = super().form_valid(*args, **kwargs)

        user = self.object
        login(self.request, user)

        return resp
