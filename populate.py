import os


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'first_project.settings')
import django

django.setup()
print(__name__)

# FAKE POP
import random
from first_app.models import Topic, WebPage, AccessRecords

from faker import Faker

topics = ['Webpage', 'Ecommerce', 'Computers', 'Education', 'Information']
fakegen = Faker()


def add_topic():
    topic = Topic.objects.get_or_create(top_name=random.choice(topics))[0]
    return topic


def populate(N=5):
    for entry in range(N):
        # get topic for the entry
        top = add_topic()
        fake_url = fakegen.url()
        fake_date = fakegen.date()
        fake_name= fakegen.company()

        # create the new web page entry
        webpg = WebPage.objects.get_or_create(topic=top, name=fake_name,url=fake_url)[0]

        # create access record
        acc_rec = AccessRecords.objects.get_or_create(webpage=webpg, date=fake_date)[0]

if __name__ == '__main__':
    populate(10)

