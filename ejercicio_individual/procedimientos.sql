USE CRONODOSIS;

-- =============================================
-- PROCEDIMIENTOS PARA TIPO_GENERO
-- =============================================
DELIMITER //

CREATE PROCEDURE sp_insertar_tipo_genero(
    IN p_nombre_genero VARCHAR(20)
)
BEGIN
    INSERT INTO tipo_genero(nombre_genero) VALUES (p_nombre_genero);
END //

CREATE PROCEDURE sp_borrado_logico_tipo_genero(
    IN p_id_genero INT
)
BEGIN
    UPDATE tipo_genero SET deleted = 1 WHERE id_genero = p_id_genero;
END //

CREATE PROCEDURE sp_mostrar_tipo_genero_activos()
BEGIN
    SELECT * FROM tipo_genero WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_tipo_genero()
BEGIN
    SELECT * FROM tipo_genero;
END //

-- =============================================
-- PROCEDIMIENTOS PARA TIPO_ALERGIAS
-- =============================================

CREATE PROCEDURE sp_insertar_tipo_alergia(
    IN p_nombre_alergia VARCHAR(100),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO tipo_alergias(nombre_alergia, descripcion) 
    VALUES (p_nombre_alergia, p_descripcion);
END //

CREATE PROCEDURE sp_borrado_logico_tipo_alergia(
    IN p_id_alergia INT
)
BEGIN
    UPDATE tipo_alergias SET deleted = 1 WHERE id_alergia = p_id_alergia;
END //

CREATE PROCEDURE sp_mostrar_tipo_alergias_activas()
BEGIN
    SELECT * FROM tipo_alergias WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todas_tipo_alergias()
BEGIN
    SELECT * FROM tipo_alergias;
END //

-- =============================================
-- PROCEDIMIENTOS PARA TIPO_USUARIO
-- =============================================

CREATE PROCEDURE sp_insertar_tipo_usuario(
    IN p_nombre_tipo_u VARCHAR(50),
    IN p_descripcion_tipo_u VARCHAR(255)
)
BEGIN
    INSERT INTO tipo_usuario(nombre_tipo_u, descripcion_tipo_u) 
    VALUES (p_nombre_tipo_u, p_descripcion_tipo_u);
END //

CREATE PROCEDURE sp_borrado_logico_tipo_usuario(
    IN p_id_tipo_u INT
)
BEGIN
    UPDATE tipo_usuario SET deleted = 1 WHERE id_tipo_u = p_id_tipo_u;
END //

CREATE PROCEDURE sp_mostrar_tipo_usuario_activos()
BEGIN
    SELECT * FROM tipo_usuario WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_tipo_usuario()
BEGIN
    SELECT * FROM tipo_usuario;
END //

-- =============================================
-- PROCEDIMIENTOS PARA PERSONAS
-- =============================================

CREATE PROCEDURE sp_insertar_persona(
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_rut VARCHAR(20),
    IN p_telefono VARCHAR(15),
    IN p_fecha_nacimiento DATE,
    IN p_id_genero INT,
    IN p_id_alergia INT,
    IN p_enfermedades_cronicas VARCHAR(200)
)
BEGIN
    INSERT INTO personas(nombre, correo, rut, telefono, fecha_nacimiento, id_genero, id_alergia, enfermedades_cronicas)
    VALUES (p_nombre, p_correo, p_rut, p_telefono, p_fecha_nacimiento, p_id_genero, p_id_alergia, p_enfermedades_cronicas);
END //

CREATE PROCEDURE sp_borrado_logico_persona(
    IN p_id_persona INT
)
BEGIN
    UPDATE personas SET deleted = 1 WHERE id_persona = p_id_persona;
END //

CREATE PROCEDURE sp_mostrar_personas_activas()
BEGIN
    SELECT * FROM personas WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todas_personas()
BEGIN
    SELECT * FROM personas;
END //

-- =============================================
-- PROCEDIMIENTOS PARA USUARIOS
-- =============================================

CREATE PROCEDURE sp_insertar_usuario(
    IN p_nombre_usuario VARCHAR(45),
    IN p_password_usuario VARCHAR(100),
    IN p_id_persona INT,
    IN p_tipo_usuario_id INT
)
BEGIN
    INSERT INTO usuarios(nombre_usuario, password_usuario, id_persona, tipo_usuario_id)
    VALUES (p_nombre_usuario, p_password_usuario, p_id_persona, p_tipo_usuario_id);
END //

CREATE PROCEDURE sp_borrado_logico_usuario(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuarios SET deleted = 1 WHERE id_usuario = p_id_usuario;
END //

CREATE PROCEDURE sp_mostrar_usuarios_activos()
BEGIN
    SELECT * FROM usuarios WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_usuarios()
BEGIN
    SELECT * FROM usuarios;
END //

-- =============================================
-- PROCEDIMIENTOS PARA TIPO_TRATAMIENTOS
-- =============================================

CREATE PROCEDURE sp_insertar_tipo_tratamiento(
    IN p_nombre_tratamiento VARCHAR(100),
    IN p_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tipo_tratamientos(nombre_tratamiento, descripcion)
    VALUES (p_nombre_tratamiento, p_descripcion);
END //

CREATE PROCEDURE sp_borrado_logico_tipo_tratamiento(
    IN p_id_tratamiento INT
)
BEGIN
    UPDATE tipo_tratamientos SET deleted = 1 WHERE id_tratamiento = p_id_tratamiento;
END //

CREATE PROCEDURE sp_mostrar_tipo_tratamientos_activos()
BEGIN
    SELECT * FROM tipo_tratamientos WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_tipo_tratamientos()
BEGIN
    SELECT * FROM tipo_tratamientos;
END //

-- =============================================
-- PROCEDIMIENTOS PARA ESTADO_PASTILLERO
-- =============================================

CREATE PROCEDURE sp_insertar_estado_pastillero(
    IN p_nombre_estado VARCHAR(50),
    IN p_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO estado_pastillero(nombre_estado, descripcion)
    VALUES (p_nombre_estado, p_descripcion);
END //

CREATE PROCEDURE sp_borrado_logico_estado_pastillero(
    IN p_id_estado INT
)
BEGIN
    UPDATE estado_pastillero SET deleted = 1 WHERE id_estado = p_id_estado;
END //

CREATE PROCEDURE sp_mostrar_estado_pastillero_activos()
BEGIN
    SELECT * FROM estado_pastillero WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_estado_pastillero()
BEGIN
    SELECT * FROM estado_pastillero;
END //

-- =============================================
-- PROCEDIMIENTOS PARA MEDICAMENTOS
-- =============================================

CREATE PROCEDURE sp_insertar_medicamento(
    IN p_nombre_medicamento VARCHAR(100),
    IN p_frecuencia_tratamiento VARCHAR(50),
    IN p_duracion_tratamiento VARCHAR(50),
    IN p_usuario_id INT,
    IN p_id_tratamiento INT
)
BEGIN
    INSERT INTO medicamentos(nombre_medicamento, frecuencia_tratamiento, duracion_tratamiento, usuario_id, id_tratamiento)
    VALUES (p_nombre_medicamento, p_frecuencia_tratamiento, p_duracion_tratamiento, p_usuario_id, p_id_tratamiento);
END //

CREATE PROCEDURE sp_borrado_logico_medicamento(
    IN p_id_medicamento INT
)
BEGIN
    UPDATE medicamentos SET deleted = 1 WHERE id_medicamento = p_id_medicamento;
END //

CREATE PROCEDURE sp_mostrar_medicamentos_activos()
BEGIN
    SELECT * FROM medicamentos WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_medicamentos()
BEGIN
    SELECT * FROM medicamentos;
END //

-- =============================================
-- PROCEDIMIENTOS PARA ALARMAS
-- =============================================

CREATE PROCEDURE sp_insertar_alarma(
    IN p_hora TIME,
    IN p_fecha DATE,
    IN p_medicamento_id INT,
    IN p_usuario_id INT
)
BEGIN
    INSERT INTO alarmas(hora, fecha, medicamento_id, usuario_id)
    VALUES (p_hora, p_fecha, p_medicamento_id, p_usuario_id);
END //

CREATE PROCEDURE sp_borrado_logico_alarma(
    IN p_id_alarma INT
)
BEGIN
    UPDATE alarmas SET deleted = 1 WHERE id_alarma = p_id_alarma;
END //

CREATE PROCEDURE sp_mostrar_alarmas_activas()
BEGIN
    SELECT * FROM alarmas WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todas_alarmas()
BEGIN
    SELECT * FROM alarmas;
END //

-- =============================================
-- PROCEDIMIENTOS PARA HISTORIAL_MEDICAMENTOS
-- =============================================

CREATE PROCEDURE sp_insertar_historial(
    IN p_medicamento_id INT,
    IN p_usuario_id INT,
    IN p_fecha DATE,
    IN p_hora TIME,
    IN p_cumplimiento_tratamiento VARCHAR(20)
)
BEGIN
    INSERT INTO historial_medicamentos(medicamento_id, usuario_id, fecha, hora, cumplimiento_tratamiento)
    VALUES (p_medicamento_id, p_usuario_id, p_fecha, p_hora, p_cumplimiento_tratamiento);
END //

CREATE PROCEDURE sp_borrado_logico_historial(
    IN p_id_historial INT
)
BEGIN
    UPDATE historial_medicamentos SET deleted = 1 WHERE id_historial = p_id_historial;
END //

CREATE PROCEDURE sp_mostrar_historial_activo()
BEGIN
    SELECT * FROM historial_medicamentos WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todo_historial()
BEGIN
    SELECT * FROM historial_medicamentos;
END //

-- =============================================
-- PROCEDIMIENTOS PARA PASTILLEROS
-- =============================================

CREATE PROCEDURE sp_insertar_pastillero(
    IN p_nombre_pastillero VARCHAR(100),
    IN p_usuario_id INT,
    IN p_id_estado INT
)
BEGIN
    INSERT INTO pastilleros(nombre_pastillero, usuario_id, id_estado)
    VALUES (p_nombre_pastillero, p_usuario_id, p_id_estado);
END //

CREATE PROCEDURE sp_borrado_logico_pastillero(
    IN p_id_pastillero INT
)
BEGIN
    UPDATE pastilleros SET deleted = 1 WHERE id_pastillero = p_id_pastillero;
END //

CREATE PROCEDURE sp_mostrar_pastilleros_activos()
BEGIN
    SELECT * FROM pastilleros WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_pastilleros()
BEGIN
    SELECT * FROM pastilleros;
END //

-- =============================================
-- PROCEDIMIENTOS PARA TUTOR_USUARIO
-- =============================================

CREATE PROCEDURE sp_insertar_tutor_usuario(
    IN p_tutor_id INT,
    IN p_usuario_id INT
)
BEGIN
    INSERT INTO tutor_usuario(tutor_id, usuario_id)
    VALUES (p_tutor_id, p_usuario_id);
END //

CREATE PROCEDURE sp_borrado_logico_tutor_usuario(
    IN p_id_tutor_usuario INT
)
BEGIN
    UPDATE tutor_usuario SET deleted = 1 WHERE id_tutor_usuario = p_id_tutor_usuario;
END //

CREATE PROCEDURE sp_mostrar_tutor_usuario_activos()
BEGIN
    SELECT * FROM tutor_usuario WHERE deleted = 0;
END //

CREATE PROCEDURE sp_mostrar_todos_tutor_usuario()
BEGIN
    SELECT * FROM tutor_usuario;
END //

DELIMITER ;