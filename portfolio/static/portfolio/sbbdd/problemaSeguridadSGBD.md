# Reto 8: Estrategias de Seguridad en la Base de Datos de la Escuela Bojo Bushido

## Introducción
Durante el Reto 8, me he sumergido en la problemática que enfrentaba la **Escuela Bojo Bushido de Tronchavacas de Arriba** con su sistema de gestión de bases de datos. He implementado estrategias de seguridad esenciales para proteger la integridad de la información y prevenir accesos no autorizados. Aquí está el detalle de mis acciones:

## 1. Investigación de estrategias de seguridad
Primero, investigué las mejores prácticas de seguridad para sistemas de gestión de bases de datos. Me enfoqué en:
- **Gestión de usuarios y roles:** Asegurando que cada usuario tuviera solo los permisos necesarios.
- **Políticas de contraseñas:** Contraseñas complejas y seguras, con cambios periódicos y restricciones de reutilización.
- **Control de acceso:** Solo usuarios autorizados pueden acceder a los datos sensibles.
- **Encriptación de datos:** Implementación de encriptación tanto en reposo como en tránsito.
- **Auditoría de seguridad:** Monitoreo y registro de todas las actividades en la base de datos.

## 2. Creación de usuarios y roles
Diseñé una estructura de usuarios y roles que reflejaba los diferentes niveles de acceso necesarios:
- **Administradores de la base de datos:**
  - **Rol:** Admin_DB
  - **Permisos:** Todos los permisos, incluyendo creación y eliminación de bases de datos, tablas, usuarios y roles.
  - **Usuarios:** db_admin1, db_admin2
- **Profesores:**
  - **Rol:** Prof_DB
  - **Permisos:** Acceso para crear y modificar información de los cursos y calificaciones de los estudiantes.
  - **Usuarios:** profesor1, profesor2, profesor3
- **Estudiantes:**
  - **Rol:** Estu_DB
  - **Permisos:** Lectura de sus propias calificaciones y cursos. No tienen permisos de modificación en la base de datos.
  - **Usuarios:** estudiante1, estudiante2, estudiante3
- **Personal de tienda:**
  - **Rol:** Tienda_DB
  - **Permisos:** Gestión de pedidos, incluyendo creación, modificación y eliminación de pedidos en la tienda online.
  - **Usuarios:** tienda1, tienda2, tienda3

## 3. Políticas de contraseñas seguras
Definí e implementé políticas de contraseñas seguras para todos los usuarios:
- **Requisitos de complejidad:** Contraseñas de al menos 12 caracteres, incluyendo letras mayúsculas y minúsculas, números y caracteres especiales.
- **Cambios periódicos:** Los usuarios deben cambiar sus contraseñas cada 90 días.
- **Restricciones de reutilización:** No se permite la reutilización de las últimas 5 contraseñas.

## 4. Encriptación de datos
Implementé encriptación para los datos sensibles almacenados en la base de datos:
- **Encriptación en reposo:** Utilicé encriptación AES-256 para los datos almacenados, asegurando que estén protegidos incluso si los discos duros son comprometidos.
- **Encriptación en tránsito:** Utilicé TLS (Transport Layer Security) para encriptar las comunicaciones entre el cliente y el servidor de la base de datos, protegiendo los datos en tránsito.

## 5. Implementación de controles de acceso
Establecí controles de acceso que limitan las operaciones que los usuarios pueden realizar en la base de datos:
- **Acceso a tablas específicas:** Los estudiantes solo tienen acceso a las tablas que contienen sus propias calificaciones, y el personal de tienda solo puede acceder a los pedidos.
- **Operaciones SQL:** Solo los administradores de la base de datos tienen permisos para realizar operaciones SQL sensibles como DELETE y DROP.
- **Acceso a datos sensibles:** Aseguré que solo los usuarios autorizados puedan acceder a datos críticos, como la información personal de los estudiantes.

