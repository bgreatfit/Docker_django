import os


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'first_project.settings')
import django

django.setup()
print(__name__)

# FAKE POP
import random
from polls.models import Question, Choice

from faker import Faker

topics = ['What is a Webpage', 'Ecommerce', 'Computers', 'Education', 'Information']
fakegen = Faker()


def add_question(date):
    question = Question.objects.get_or_create(question_text=random.choice(topics),pub_date=date)[0]
    return question


def populate(N=5):
    for entry in range(N):
        # get topic for the entry
        fake_date = fakegen.date()
        qst = add_question(fake_date)
        fake_number = random.randint(1,5)
        #
        fake_text= fakegen.text()

        # create the new web page entry
        choice = Choice.objects.get_or_create(question=qst, votes=fake_number, choice_text=fake_text)[0]

        # create access record
        # acc_rec = AccessRecords.objects.get_or_create(webpage=webpg, date=fake_date)[0]

if __name__ == '__main__':
    populate(10)

