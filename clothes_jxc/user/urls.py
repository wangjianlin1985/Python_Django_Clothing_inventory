from django.urls import path

from . import views

app_name = 'user'
urlpatterns = [
    path('', views.list, name='index'),
    path('add', views.add, name='add'),
    path('search', views.search, name='search'),
    path('update/<int:user_id>', views.update, name='update'),
    path('delete/<int:user_id>', views.delete, name='delete')
]
