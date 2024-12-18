"""
Este módulo contiene los modelos de la aplicación Portfolio.
"""

from django.db import models

class Project(models.Model):
    """
    Modelo que representa un proyecto en el portafolio.
    """
    title = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='projects/')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    objects = models.Manager()  # Asegúrate de definir el administrador de objetos
