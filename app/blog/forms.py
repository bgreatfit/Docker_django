from django import forms
from .models import Post, Comment


class PostForm(forms.ModelForm):
    model = Post
    fields = ('author', 'title','text' )

    class Meta:
        widgets = {
            'title': forms.TextInput(attrs={'class': 'textinputclass'}),
            'text': forms.Textarea(attrs={'class': 'editable medium-editor-textarea post-content'})
        }


class CommentForm(forms.ModelForm):
    model = Post
    fields = ('author', 'text')

    class Meta:
        widgets = {
            'author': forms.TextInput(attrs={'class': 'textinputclass'}),
            'text': forms.Textarea(attrs={'class': 'editable medium-editor-textarea'}),
        }
