-- TravesIA · Esquema de la base de datos (PostgreSQL / Neon)

CREATE TABLE usuarios (
    id            uuid         PRIMARY KEY DEFAULT gen_random_uuid(),
    email         varchar(255) NOT NULL UNIQUE,
    nombre        varchar(100),
    avatar_url    text,
    proveedor     varchar(20)  NOT NULL DEFAULT 'google',
    proveedor_id  varchar(255),
    creado_en     timestamptz  NOT NULL DEFAULT now(),
    UNIQUE (proveedor, proveedor_id)
);

CREATE TABLE chats (
    id              uuid         PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario_id      uuid         NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    titulo          varchar(150) NOT NULL DEFAULT 'Nuevo viaje',
    destino         varchar(150),
    fecha_inicio    date,
    num_dias        smallint     CHECK (num_dias BETWEEN 1 AND 14),
    presupuesto     varchar(20)  CHECK (presupuesto IN ('bajo', 'medio', 'alto')),
    ritmo           varchar(20)  CHECK (ritmo IN ('tranquilo', 'normal', 'intenso')),
    creado_en       timestamptz  NOT NULL DEFAULT now(),
    actualizado_en  timestamptz  NOT NULL DEFAULT now()
);

CREATE TABLE mensajes (
    id         uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    chat_id    uuid        NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    rol        varchar(10) NOT NULL CHECK (rol IN ('usuario', 'ia')),
    contenido  text        NOT NULL,
    creado_en  timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE itinerarios (
    id         uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    chat_id    uuid        NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    version    integer     NOT NULL DEFAULT 1 CHECK (version > 0),
    datos      jsonb       NOT NULL,
    creado_en  timestamptz NOT NULL DEFAULT now(),
    UNIQUE (chat_id, version)
);

CREATE INDEX idx_chats_usuario  ON chats (usuario_id, actualizado_en DESC);
CREATE INDEX idx_mensajes_chat  ON mensajes (chat_id, creado_en);
