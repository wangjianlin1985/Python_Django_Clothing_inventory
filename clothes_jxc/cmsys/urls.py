"""cmsys URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from common import views

app_name = 'customer'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout, name='logout'),
    path('changpwd/', views.changepwd, name='changepwd'),
    path('captcha', include('captcha.urls')),
    path('user/', include('user.urls')),
    path('customer/', include('customer.urls')),
    path('clothes/', include('clothes.urls')),
    path('inorder/', include('inorder.urls')),
    path('outorder/', include('outorder.urls')),
    path('checkusername/<str:username>/',views.checkusername, name='checkusername')
]
