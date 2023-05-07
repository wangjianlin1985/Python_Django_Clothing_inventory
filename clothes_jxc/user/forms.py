import re

from django import forms
from django.core.exceptions import ValidationError


def username_validate(value):
    username_re = re.compile(r'^[a-zA-Z0-9]{4,16}$')
    if not username_re.match(value):
        raise ValidationError('用户名格式错误,只能输入4-16个字母、数字')


def password_validate(value):
    password_re = re.compile(r'^(a-zA-Z0-9){6,16}$')
    if not password_re.match(value):
        raise ValidationError('密码格式错误，只能输入6-20个字母、数字')


class UserForm(forms.Form):
    role_choices = (
        ('操作员', '操作员'),
        ('管理员', '管理员')
    )
    id = forms.IntegerField(label='ID', required=False,
                            widget=forms.TextInput({'class': 'form-control', 'disabled': 'disabled'}))
    username = forms.CharField(label="用户名", validators=[username_validate, ], max_length=32,
                               widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="密码", max_length=100,
                               widget=forms.TextInput(attrs={'class': 'form-control'}))
    name = forms.CharField(label="姓名", max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    role = forms.ChoiceField(label="角色", choices=role_choices, widget=forms.Select(attrs={'class': 'form-control'}))
    create_time = forms.CharField(label='创建时间', required=False, max_length=32,
                                  widget=forms.TextInput(attrs={'class': 'form-control', 'disabled': 'disabled'}))
