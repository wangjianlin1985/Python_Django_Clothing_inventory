import re

from django import forms
from django.core.exceptions import ValidationError


def phone_validate(value):
    phone_re = re.compile(r'^1[3456789]\d{9}$')
    if not phone_re.match(value):
        raise ValidationError('手机格式错误')


class CustomerForm(forms.Form):
    id = forms.IntegerField(label='ID', required=False,
                            widget=forms.TextInput({'class': 'form-control', 'disabled': 'disabled'}))
    name = forms.CharField(label='客户名', max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    phone = forms.CharField(label='电话', validators=[phone_validate, ], max_length=11,
                            widget=forms.TextInput(attrs={'class': 'form-control'}))
    address = forms.CharField(label='地址', max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    create_time = forms.CharField(label='创建时间', required=False, max_length=32,
                                  widget=forms.TextInput(attrs={'class': 'form-control', 'disabled': 'disabled'}))
