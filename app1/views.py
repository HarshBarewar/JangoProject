# from django.shortcuts import render

# def home(request):
#     return render(request, "app1/home.html")  # Ensure this matches the file path


# from django.shortcuts import render , HttpResponse

# # Create your views here.
# def index(request):
#     return render(request,'app1/home.html')

from django.shortcuts import render

def home(request):
    return render(request, "app1/home.html")  # ✅ Correct path

