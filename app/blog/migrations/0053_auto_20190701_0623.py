# Generated by Django 2.1.5 on 2019-07-01 05:23

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0052_auto_20190630_1812'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='created_date',
            field=models.DateTimeField(default=datetime.datetime(2019, 7, 1, 5, 23, 33, 509452, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='post',
            name='created_date',
            field=models.DateTimeField(default=datetime.datetime(2019, 7, 1, 5, 23, 33, 508753, tzinfo=utc)),
        ),
    ]
