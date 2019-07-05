from django.contrib.auth.models import User
from rest_framework import serializers
from . import models


class UserSerializer(serializers.ModelSerializer):
    courses = serializers.HyperlinkedRelatedField(many=True,
                                                  queryset=models.Course.objects.all(),
                                                  view_name='course:course-detail')

    class Meta:
        model = User
        fields = ('id', 'username', 'courses')


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        extra_kwargs = {
            'email': {'write_only': True}
        }
        fields = (
            'id',
            'course',
            'name',
            'email',
            'comment',
            'rating',
            'created_at',
        )
        model = models.Review


class CourseSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    reviews = serializers.HyperlinkedRelatedField(many=True, read_only=True,
                                                  view_name='apiv2:review-detail')

    class Meta:
        fields = (
            'id',
            'title',
            'url',
            'owner',
            'reviews',

        )
        model = models.Course
