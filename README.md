# The Rial News

The Rial News es un sitio de noticias ficticias donde los usuarios pueden crear y comentar noticias. Esta aplicación está diseñada para practicar el uso de roles y autenticación dentro de una aplicación en Rails.

## Características

- **Roles de Usuario**:
  - **Subscriber**: Los usuarios pueden crear y borrar sus propias noticias y comentarios.
  - **Admin**: Los administradores pueden borrar cualquier post y comentario.

## Tecnologías Usadas

  - Ruby on Rails
  - PostgreSQL (o el sistema de base de datos que estés utilizando)
  - Action Mailer para el envío de correos electrónicos

## Instalación

Para instalar y ejecutar la aplicación, sigue estos pasos:

  1. Clona el repositorio:
  - git clone https://github.com/tripleG-Master/therialnews.git

1. Navega al directorio del proyecto:

  - cd therialnews

3. Instala las dependencias y configura la base de datos:

  - bundle install
  - rails db:create
  - rails db:migrate 
  - rails db:seed


4. Configura las credenciales de Gmail para las funcionalidades del mailer. 

- Asegúrate de tener habilitada la verificación en dos pasos y de generar una contraseña de aplicación. Para editar las credenciales en Rails, utiliza el siguiente comando según tu sistema operativo:


- powershell 
  - $env:EDITOR="code --wait"
  - rails credentials:edit

- cmd 
  - set EDITOR=code --wait 
  - rails credentials:edit

- linux/mac 
  - EDITOR="code --wait"
  - rails credentials:edit

* Importante!! 
  
  - Para el mailer gmail Para cuentas con 2FA Verificacion de 2 pasos Cuenta de Google / Seguridad / Verificacion en 2 pasos / Contraseñas de aplicacion (al final de la pagina)

  - Luego, agrega tus credenciales de Gmail en el archivo que se abre:

- gmail:
  - username: "current_email"@gmail.com
  - password: "current password or generated by 2FA"

1. Inicia el servidor:
  - rails s


## Uso
Una vez que el servidor esté en funcionamiento, puedes acceder a la aplicación en tu navegador en http://127.0.0.1:3000. Desde allí, los usuarios pueden registrarse, iniciar sesión, crear noticias y comentar en las noticias existentes.


- Usuarios de prueba
  - 'admin@mail.com',
  - 'gcarlos.gabriel4@gmail.com',
  - 'subscriber@mail.com',
  - 'user@mail.com',
  - 'user2@mail.com',
  - 'user3@mail.com',

- Password
  - 'password'


## Licencia
- Este proyecto está licenciado bajo la MIT License.

### Notas:
- Asegúrate de reemplazar `"current_email@gmail.com"` y `"current password or generated by 2FA"` con las credenciales adecuadas.
