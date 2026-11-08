-- TravesIA · Tablas de fases posteriores (categorías, lugares, reseñas y registro de IA)

CREATE TABLE categorias (
    id      smallint    GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre  varchar(50) NOT NULL UNIQUE
);

CREATE TABLE chat_categorias (
    chat_id       uuid     NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    categoria_id  smallint NOT NULL REFERENCES categorias(id),
    PRIMARY KEY (chat_id, categoria_id)
);

CREATE TABLE lugares (
    id                   uuid          PRIMARY KEY DEFAULT gen_random_uuid(),
    categoria_id         smallint      REFERENCES categorias(id),
    nombre               varchar(200)  NOT NULL,
    ciudad               varchar(100)  NOT NULL,
    direccion            text,
    latitud              numeric(9,6)  CHECK (latitud BETWEEN -90 AND 90),
    longitud             numeric(9,6)  CHECK (longitud BETWEEN -180 AND 180),
    web_oficial          text,
    descripcion_oficial  text,
    actualizado_en       timestamptz   NOT NULL DEFAULT now()
);

CREATE TABLE resenas (
    id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id  uuid        NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    lugar_id    uuid        NOT NULL REFERENCES lugares(id) ON DELETE CASCADE,
    puntuacion  smallint    NOT NULL CHECK (puntuacion BETWEEN 1 AND 5),
    comentario  text,
    creado_en   timestamptz NOT NULL DEFAULT now(),
    UNIQUE (usuario_id, lugar_id)
);

CREATE TABLE generaciones (
    id              uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    chat_id         uuid        NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    tokens_entrada  integer,
    tokens_salida   integer,
    duracion_ms     integer,
    correcta        boolean     NOT NULL,
    creado_en       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_lugares_ciudad       ON lugares (ciudad);
CREATE INDEX idx_resenas_lugar        ON resenas (lugar_id);
CREATE INDEX idx_generaciones_chat    ON generaciones (chat_id, creado_en);

-- Categorías iniciales (ajustadlas a lo que decida el equipo)
INSERT INTO categorias (nombre) VALUES
('Museos'), ('Monumentos'), ('Restaurantes'), ('Naturaleza'), ('Ocio nocturno'), ('Tours y excursiones'), ('Compras');
