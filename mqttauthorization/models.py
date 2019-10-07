from django.db import models


class MqttAcls(models.Model):
    username = models.CharField(max_length=200)
    pw = models.CharField(max_length=200)
    superuser = models.PositiveSmallIntegerField(default=0)

    constraints = [
        CheckConstraint(
                check=~Q(superuser=0) | ~Q(superuser=1),
                name="system_not_blank")
    ]

# class MqttAccount(models.Model):
#     question_text = models.CharField(max_length=200)
#     pub_date = models.DateTimeField('date published')
