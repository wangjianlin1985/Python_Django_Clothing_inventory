from django import forms


class ClothesForm(forms.Form):
    size_choices = (
        ('S', 'S'),
        ('M', 'M'),
        ('L', 'L'),
        ('XL', 'XL'),
        ('XXL', 'XXL')
    )
    id = forms.IntegerField(label='ID', required=False,
                            widget=forms.TextInput({'class': 'form-control', 'disabled': 'disabled'}))
    name = forms.CharField(label='服装名', max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    sn = forms.CharField(label='服装号', max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    price = forms.DecimalField(label='价格', max_digits=10, decimal_places=2,
                               widget=forms.NumberInput(attrs={'class': 'form-control'}))
    size = forms.ChoiceField(label='尺寸', choices=size_choices, widget=forms.Select(attrs={'class': 'form-control'}))
    color = forms.CharField(label='颜色', max_length=32, widget=forms.TextInput(attrs={'class': 'form-control'}))
    stock = forms.IntegerField(label='库存', widget=forms.NumberInput(attrs={'class': 'form-control'}))
    image = forms.ImageField(label='图片', required=False, widget=forms.FileInput(attrs={'class': 'form-control'}))
    desc = forms.CharField(label='描述', required=False, max_length=200,
                           widget=forms.Textarea(attrs={'class': 'form-control'}))
