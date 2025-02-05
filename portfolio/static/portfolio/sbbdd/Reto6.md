<!-- Informe del Reto 6 -->
Elección del SGBD NoSQL
Para la tienda online de la aldea Data Mura, he seleccionado MongoDB como el SGBD NoSQL más adecuado debido a sus características avanzadas y flexibilidad.

Justificación:

Modelo de datos flexible: MongoDB utiliza documentos en formato JSON que permiten manejar datos estructurados y no estructurados.

Escalabilidad horizontal: MongoDB soporta el "sharding" para distribuir datos a través de múltiples servidores, ideal para manejar grandes volúmenes de datos.

Consultas avanzadas: Proporciona potentes capacidades de consulta, indexación y agregación.

Soporte para réplicas: Mejora la disponibilidad y la redundancia de los datos.

Investigación del SGBD elegido
MongoDB utiliza un modelo de datos basado en documentos:

Documentos: Los documentos son objetos JSON que almacenan datos de una manera muy flexible y anidada.

Colecciones: Conjunto de documentos, similar a las tablas en una base de datos relacional.

Índices: Para mejorar el rendimiento de las consultas.

Agregación: Para realizar operaciones complejas como contar, sumar, agrupar, etc.

Modelo de datos unificado
Colección: Productos

json
{
  "producto_id": "P001",
  "nombre": "Taza de Cerámica",
  "categoría": "Artesanía",
  "precio": 15.99,
  "stock": 120,
  "tipo": "artesanía",
  "detalles": {
    "descripción": "Taza hecha a mano con diseños tradicionales."
  }
}
json
{
  "producto_id": "H001",
  "nombre": "Ginseng",
  "categoría": "Hierbas Medicinales",
  "precio": 25.99,
  "stock": 80,
  "tipo": "hierbas_medicinales",
  "detalles": {
    "beneficios": "Aumenta la energía y la vitalidad.",
    "descripcion": "Raíz de ginseng de alta calidad recolectada de manera sostenible."
  }
}
Colección: Clientes

json
{
  "cliente_id": "C001",
  "nombre": "Juan Pérez",
  "correo": "<juan.perez@example.com>",
  "dirección": "Calle Falsa 123, Leganés, Madrid"
}
Colección: Pedidos

json
{
  "pedido_id": "O001",
  "cliente_id": "C001",
  "fecha": "2025-02-04T10:30:00Z",
  "productos": [
    {"producto_id": "P001", "cantidad": 2},
    {"producto_id": "H001", "cantidad": 1}
  ],
  "total": 71.96
}
Ventajas y desventajas
Ventajas de MongoDB
Escalabilidad: MongoDB puede manejar grandes volúmenes de datos mediante el sharding.

Flexibilidad: El modelo de datos basado en documentos permite adaptarse rápidamente a cambios en los requisitos de datos.

Consultas avanzadas: Proporciona potentes herramientas para consultas y agregaciones.

Desventajas de MongoDB
Curva de aprendizaje: MongoDB tiene una curva de aprendizaje más pronunciada para quienes están acostumbrados a bases de datos relacionales.

Consistencia eventual: En configuraciones distribuidas, puede haber momentos en los que los datos no estén inmediatamente consistentes.

Costos operativos: La gestión de una infraestructura distribuida puede ser más costosa y compleja.

Comparación con otros SGBD NoSQL
Ventajas de MongoDB sobre Redis
Modelo de Datos Flexible:

MongoDB: Usa un modelo de documentos JSON que permite almacenar datos estructurados y no estructurados de manera flexible, adecuado para la variedad de productos y detalles en una tienda online.

Redis: Aunque Redis es excelente para almacenamiento de datos en memoria y operaciones rápidas, se basa en un modelo de datos clave-valor, lo que puede ser menos flexible para datos complejos y anidados.

Consultas Avanzadas:

MongoDB: Ofrece potentes capacidades de consulta y agregación, permitiendo realizar búsquedas y filtros complejos dentro de los documentos.

Redis: Las capacidades de consulta de Redis son más limitadas y generalmente requieren un diseño cuidadoso del esquema de datos y claves para obtener consultas eficientes.

Persistencia de Datos:

MongoDB: Almacena los datos en disco de forma persistente, lo que lo hace adecuado para aplicaciones que requieren durabilidad y recuperación de datos.

Redis: Está optimizado para operaciones en memoria, y aunque soporta persistencia, la configuración predeterminada y uso común se centra en la velocidad y no en la durabilidad a largo plazo.

Ventajas de MongoDB sobre Cassandra
Facilidad de Uso:

MongoDB: Es conocido por su facilidad de uso y su sintaxis amigable, lo que puede acelerar el desarrollo y la implementación.

Cassandra: Tiene una curva de aprendizaje más pronunciada y requiere un buen conocimiento de su modelo de datos distribuido y su lenguaje de consultas, CQL (Cassandra Query Language).

Modelo de Datos y Flexibilidad:

MongoDB: Su modelo de documentos JSON es muy flexible y permite cambios en la estructura de datos sin necesidad de redefinir esquemas.

Cassandra: Utiliza un modelo de datos basado en columnas y está optimizado para grandes volúmenes de datos y alta disponibilidad, pero es menos flexible en términos de estructura de datos.

Consultas y Agregaciones:

MongoDB: Soporta consultas y agregaciones complejas de manera nativa, lo que facilita la extracción de información detallada y la realización de análisis.

Cassandra: Aunque soporta algunas operaciones de agregación, no está tan optimizado para consultas ad-hoc complejas como MongoDB.

Conclusión
MongoDB se destaca por su flexibilidad, facilidad de uso y capacidades de consulta avanzadas, lo que lo convierte en una opción sólida para la tienda online de Data Mura. Mientras que Redis es excelente para aplicaciones de alto rendimiento en memoria y Cassandra es ideal para grandes volúmenes de datos distribuidos, MongoDB ofrece un equilibrio entre flexibilidad y funcionalidad que puede adaptarse mejor a las necesidades de una tienda online variada y dinámica.
