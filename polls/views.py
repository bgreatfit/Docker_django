from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, Http404
from django.template import loader
import pandas as pd
import numpy as np
from .models import Question,Topic,WebPage,AccessRecords
from . import forms, new_user_form
import matplotlib.pyplot as plt


# Create your views here.

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)


# def index(request):
#     # try:
#
#     acces_recs = AccessRecords.objects.order_by('date')
#
#     context = {'acces_recs':acces_recs}
#     return render(request,'polls/index.html',context)
    #return render(request,'first_app.index.html')

def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)


def polls(request, id):

    # try:
    question_test = {'test': ['hi', 'two', 'three']}
    response = ",".join([question for question in question_test['test']])
    #map();
    # except



    data = np.random.randn(2, 3);
    data = {'data':data}
    latest_question_list = Question.objects.order_by('-pub_date')
    context = {'latest_question_list': latest_question_list,'data':data}
    # return latest_question_list
    # output = ', '.join([q.question_text for q in latest_question_list])
    return render(request,'polls/polls.html',context)
    #return render(request,'first_app.index.html')


def view(request,id):
    try:
       question = Question.objects.get(pk=id)

    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request,'polls/index.html', {'question': question})


def form_page(request):
    form = forms.Formname()
    # check to see if we get a post back
    if request.method == "POST":
        form = forms.Formname(request.POST)
        print('Here')
        if form.is_valid():
            print('Form Validation Prints in console')
            print(form.cleaned_data)
            print(form.cleaned_data['name'])
            print(form.cleaned_data['email'])
            print(form.cleaned_data['text'])
    return render(request, 'polls/form_page.html', {'form': form})


def new_user(request):
    userform = new_user_form.UserForm()
    if request.method == 'POST':
        userform = new_user_form.UserForm(request.POST)
        if userform.is_valid():
            userform.save(commit=True)
            return index(request)
    return render(request,'polls/registration.html', {'form': userform})



