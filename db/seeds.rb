# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Post.destroy_all()
User.destroy_all()
Role.destroy_all()

## Seed roles
admin_role = Role.create!(role: 'admin')
subscriber_role = Role.create!(role: 'subscriber')

## Seed users

emails = [
    'admin@mail.com',
    'gcarlos.gabriel4@gmail.com',
    'subscriber@mail.com',
    'user@mail.com',
    'user2@mail.com',
    'user3@mail.com',
]

password = "password"
users = []

emails.each do |email| 
    role = case email
        when 'admin@mail.com'
            admin_role
        else
            subscriber_role
        end

    users << {
        email: email, 
        password: password,
        password_confirmation: password,
        role_id: role.id,
    }
end

users.each do |user_attributes|
    User.create!(user_attributes)
end



## Seed posts

posts = [
    {
        headline: "PAPELOOON RENE PUENTE LO PIERDE TODO",
        drophead: "Seria un ajuste de cuentas",
        body: "El conocido artista urbano Rene puente, alias: Cabeza de muela Cabeza de refri Cabeza de tele Cabeza de yunque Cabeza de satélite ruso Cabeza de bunker Cabeza de tanque Cabeza de moai Cabeza de microondas Cabeza de zapallo Cabeza de ñuñuki Cabeza de mochila rappi Cabeza de camioneta mahindra ...",
        user_id: User.all.sample.id
    },
    {
        headline: "LA NUEVA ERA DEL HIP HOP",
        drophead: "Un vistazo a los nuevos talentos",
        body: "El hip hop está evolucionando con nuevos artistas que traen frescura y originalidad a la escena musical. Desde ritmos innovadores hasta letras profundas, la nueva generación está lista para conquistar el mundo.",
        user_id: User.all.sample.id
    },
    {
        headline: "CONCIERTO EN VIVO: UNA NOCHE INOLVIDABLE",
        drophead: "La música en su máxima expresión",
        body: "El concierto de anoche fue un espectáculo impresionante, lleno de energía y emoción. Los fanáticos disfrutaron de cada momento, creando recuerdos que durarán toda la vida.",
        user_id: User.all.sample.id
    },
    {
        headline: "TENDENCIAS MUSICALES DEL 2023",
        drophead: "Lo que está de moda este año",
        body: "Este año, las colaboraciones entre artistas de diferentes géneros están en auge. La fusión de estilos está creando música innovadora que atrae a una audiencia diversa.",
        user_id: User.all.sample.id
    },
    {
        headline: "ENTREVISTA EXCLUSIVA CON UN ARTISTA EMERGENTE",
        drophead: "Conoce su historia y su música",
        body: "En esta entrevista, hablamos con un artista emergente que está haciendo olas en la industria. Comparte su viaje, sus inspiraciones y lo que significa para él ser parte de la comunidad musical.",
        user_id: User.all.sample.id
    }
]

# Crear posts en la base de datos
posts.each do |post_attributes|
    Post.create!(post_attributes)
end

## Seed comments
comments = [
    { description: "Esta es una muy buena noticia!", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "Me encanta la música de este artista!",user_id: User.all.sample.id,post_id: Post.all.sample.id},
    { description: "Este post es muy interesante, gracias por compartir!",user_id: User.all.sample.id,post_id: Post.all.sample.id},
    { description: "Apoyo a la comunidad musical!",user_id: User.all.sample.id,post_id: Post.all.sample.id},
    { description: "Necesito seguir a este artista!",user_id: User.all.sample.id,post_id: Post.all.sample.id},
    
    # Comentarios positivos generales
    { description: "¡Excelente trabajo! Me encanta cómo has desarrollado esta idea.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "Este post me ha inspirado a crear mi propia música.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "¡Muy útil! Este tutorial me ha ayudado mucho.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
  
    # Comentarios sobre contenido específico
    { description: "La letra de esta canción es increíblemente profunda.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "El solo de guitarra es simplemente épico.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "La armonía de colores en este diseño es perfecta.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "El ritmo de este beat me hace mover los pies.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
  
    # Comentarios que generan discusión
    { description: "¿Alguien más nota la influencia en este trabajo?", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "Me encantaría saber más sobre el proceso creativo detrás de esta pieza.", user_id: User.all.sample.id, post_id: Post.all.sample.id },
    { description: "Creo que esta canción podría haber sido aún mejor si...", user_id: User.all.sample.id, post_id: Post.all.sample.id}
]

comments.each do |comment|
    Comment.create!(comment)
end
