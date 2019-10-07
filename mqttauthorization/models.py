from django.db import models
from django.db.models import Q

class MqttAccount(models.Model):
    username = models.CharField(max_length=40)
    pw = models.CharField(max_length=100)
    superuser = models.PositiveSmallIntegerField(default=0)

class MqttAcl(models.Model):
    username = models.CharField(max_length=40)
    topic = models.CharField(max_length=100)
    rw = models.PositiveSmallIntegerField(default=1)
