from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from .models import Update

# Create your views here.
def update_model_view(request):
    data = {
        "count":1000,
        "content":"some"
    }
    return JsonResponse(data)