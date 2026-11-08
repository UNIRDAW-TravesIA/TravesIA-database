-- TravesIA · Datos de prueba

INSERT INTO usuarios (id, email, nombre, proveedor, proveedor_id)
VALUES ('11111111-1111-1111-1111-111111111111', 'prueba@travesia.dev', 'Usuaria de prueba', 'google', 'google-123');

INSERT INTO chats (id, usuario_id, titulo, destino, fecha_inicio, num_dias, presupuesto, ritmo)
VALUES ('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Escapada a Oporto', 'Oporto', '2027-03-12', 2, 'medio', 'normal');

INSERT INTO mensajes (chat_id, rol, contenido, creado_en) VALUES
('22222222-2222-2222-2222-222222222222', 'usuario', 'Quiero ir 2 días a Oporto, me gusta la arquitectura y comer bien.', now() - interval '1 minute'),
('22222222-2222-2222-2222-222222222222', 'ia', 'Aquí tienes un plan de 2 días por Oporto.', now());

INSERT INTO itinerarios (chat_id, version, datos) VALUES
('22222222-2222-2222-2222-222222222222', 1, '{
  "destino": "Oporto",
  "dias": [
    { "dia": 1, "actividades": [
        { "hora": "10:00", "titulo": "Torre dos Clérigos", "descripcion": "Subida a la torre" },
        { "hora": "13:30", "titulo": "Comida en Ribeira", "descripcion": "Junto al río" } ] },
    { "dia": 2, "actividades": [
        { "hora": "10:30", "titulo": "Librería Lello", "descripcion": "Reservar entrada" } ] }
  ]
}');
