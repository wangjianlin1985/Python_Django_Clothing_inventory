from django.urls import path

from . import views

app_name = 'clothes'
urlpatterns = [
    path('', views.list, name='index'),
    path('add', views.add, name='add'),
    path('search', views.search, name='search'),
    path('update/<int:clothes_id>', views.update, name='update'),
    path('delete/<int:clothes_id>', views.delete, name='delete'),
    path('checkstock/<int:clothes_id>', views.checkstock, name='checkstock')
]