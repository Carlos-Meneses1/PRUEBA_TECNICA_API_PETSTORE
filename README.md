# Prueba Técnica – API PetStore

Automatización de pruebas REST utilizando Karate Framework para la API de PetStore.

## Descripción 
El sitio https://petstore.swagger.io/ proporciona una API REST completa para gestión de una tienda de mascotas.

El objetivo de este ejercicio es automatizar pruebas para el módulo de **User** con los siguientes casos:

1. Crear un usuario
2. Buscar el usuario creado
3. Actualizar el nombre y el correo del usuario
4. Buscar el usuario actualizado
5. Eliminar el usuario

---

## Requisitos previos

Antes de ejecutar el proyecto debes contar con:

- Java 8 o superior
- Maven 3.6 o superior

Verificar versiones:
```bash
java -version
mvn -version
```

---

## Estructura del proyecto
```
PRUEBA_TECNICA_API_PETSTORE/
├── pruebas-de-ejecucion/
├── src/
│   └── test/
│       ├── java/
│       │   └── petstore/
│       │       └── PetstoreTest.java
│       └── resources/
│           └── features/
│               └── petstore.feature
├── target/
├── .gitignore
├── karate-config.js
├── pom.xml
├── README.md
└── Conclusiones.txt
```

---

## Instrucciones de ejecución (PASO A PASO)

### 1. Clonar o descargar el repositorio
```bash
git clone [https://github.com/Carlos-Meneses1/PRUEBA_TECNICA_API_PETSTORE.git]
cd PRUEBA_TECNICA_API_PETSTORE
```

### 2. Ejecutar todas las pruebas
```bash
mvn test
```

O limpiar antes de ejecutar:
```bash
mvn clean test
```

### 3. Ver los reportes

Los reportes se generan automáticamente en:
```
target/karate-reports/karate-summary.html
```

Abrir el archivo en un navegador para ver:
- Casos ejecutados
- Request y Response de cada llamada
- Validaciones realizadas
- Tiempos de ejecución

---

## Casos de prueba implementados

### Caso 1: Crear un nuevo usuario
- **Endpoint:** POST /user
- **Validación:** Status 200

### Caso 2: Buscar el usuario creado
- **Endpoint:** GET /user/{username}
- **Validación:** Status 200 y coincidencia de username

### Caso 3: Actualizar nombre y correo
- **Endpoint:** PUT /user/{username}
- **Validación:** Status 200

### Caso 4: Buscar el usuario actualizado
- **Endpoint:** GET /user/{username}
- **Validación:** Status 200 y datos actualizados

### Caso 5: Eliminar el usuario
- **Endpoint:** DELETE /user/{username}
- **Validación:** Status 200

---

## Tecnologías utilizadas

| Tecnología | Versión | Descripción |
|------------|---------|-------------|
| Java | 8+ | Lenguaje base |
| Maven | 3.6+ | Gestión de dependencias |
| Karate DSL | 1.2.0 | Framework de automatización API |
| JUnit 5 | Incluido | Ejecutor de pruebas |
---

## Características destacadas

- Generación dinámica de usernames únicos usando timestamp
- Reutilización de datos mediante variables en Background
- Validaciones de status code y contenido de respuestas
- Reportes HTML detallados con evidencias
- Código limpio y mantenible

---

## Autor

Carlos Meneses Prueba técnica – Automatización API REST con Karate Framework
