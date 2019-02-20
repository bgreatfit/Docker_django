from django.shortcuts import render
from django.http import HttpResponse, Http404
from django.template import loader
import pandas as pd
import numpy as np
from .models import Question,Topic,WebPage,AccessRecords
from . import forms
import matplotlib.pyplot as plt


# Create your views here.

def index(request):
    # try:

    acces_recs = AccessRecords.objects.order_by('date')

    context = {'acces_recs':acces_recs}
    return render(request,'first_app/index.html',context)
    #return render(request,'first_app.index.html')


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
    return render(request,'first_app/index.html',context)
    #return render(request,'first_app.index.html')


def view(request,id):
    try:
       question = Question.objects.get(pk=id)

    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request,'first_app/index.html', {'question': question})


def formpage(request):
    form = forms.Formname
    render(request,'first_app/form_page.html',{'form':form})
