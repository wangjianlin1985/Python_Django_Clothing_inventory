from django.contrib import admin

# Register your models here.
from common import models

admin.site.register(models.User)
admin.site.register(models.Clothes)
admin.site.register(models.Customer)
admin.site.register(models.Inorder)
admin.site.register(models.InorderClothes)
admin.site.register(models.Outorder)
admin.site.register(models.OutorderClothes)