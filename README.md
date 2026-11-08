# Base de datos de TravesIA

Base de datos del proyecto TravesIA, una aplicación web que genera itinerarios de viaje con inteligencia artificial.

- **Motor:** PostgreSQL
- **Alojamiento:** Neon (región Europa, Frankfurt)
- **Responsable:** Rol 3 (datos, autenticación y calidad)

## Contenido

| Archivo | Qué es |
| --- | --- |
| `schema.sql` | Crea las 4 tablas del MVP: usuarios, chats, mensajes e itinerarios. |
| `schema_fase2.sql` | Crea las 5 tablas de fases posteriores: categorías, lugares, reseñas, chat_categorias y generaciones. |
| `datos_prueba.sql` | Datos de ejemplo para desarrollar y hacer pruebas. |
| `diagrama.dbml` | Código del diagrama entidad-relación (se abre en dbdiagram.io). |
| `diagrama_er.png` | Imagen del diagrama entidad-relación. |

## Cómo crear la base de datos desde cero

Ejecutar los scripts en este orden en el SQL Editor de Neon:

1. `schema.sql`
2. `schema_fase2.sql`
3. `datos_prueba.sql` (opcional, solo para pruebas)

El orden importa: las tablas de `schema_fase2.sql` dependen de las de `schema.sql`.

## Conexión

La cadena de conexión **no** está en este repositorio porque contiene la contraseña de la base de datos. Se guarda en la variable `DATABASE_URL` del archivo `.env` del backend. Pídesela al Rol 3.

## Próximos pasos

- Catálogo de consultas SQL para el backend.
- Búsqueda de lugares por similitud con la extensión pgvector.
