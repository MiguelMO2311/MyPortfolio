"""
Este módulo contiene las vistas de la aplicación Portfolio.
"""

from django.shortcuts import render
from .models import Project

def home(request):
    """
    Vista para la página de inicio.
    """
    return render(request, 'portfolio/home.html')

def about(request):
    """
    Vista para la página sobre mí.
    """
    return render(request, 'portfolio/about.html')

def projects(request):
    """
    Vista para la página de proyectos.
    """
    all_projects = Project.objects.all()
    return render(request, 'portfolio/projects.html', {'projects': all_projects})

def contact(request):
    """
    Vista para la página de contacto.
    """
    return render(request, 'portfolio/contact.html')
