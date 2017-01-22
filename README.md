# The librarian

Fork para test técnico de Redvel.

## Installation

Clona el proyecto.

```sh
$ git clone https://github.com/edolivares/the-librarian.git
```

Luego ejecuta bundle install para instalar todas las gemas y dependencias:

```sh
$ bundle install
```

### Inicialización del proyecto

> **Nota:**

> - El proyecto viene con una base de datos en sqlite, con la tabla Books. Siendo esta la tabla base del proyecto test, al agregar nuevas tablas, junto a sus relaciones en el modelo, lanza un ActiveRecord::AssociationTypeMismatch. Por esto, las relaciones, en el modelo Book, están comentadas.

Primero se hace necesario crear, migrar y poblar la base de datos:

> **Nota:**

> - Como se está utilizando sqlite, no es necesario ejecutar el comando create (rake db:create), por lo que nos saltaremos directamente al migrate.
```sh
$ rake db:migrate
$ rake db:seed
```
Una vez que el paso anterior esté completado, es necesario que se quiten los comentarios, de las relaciones, en el modelo Book `app/models/book.rb`. 

```ruby
# belongs_to :editorial
# has_many :registros
# has_many :authors, through: :registros
# has_attached_file :cover_photo, styles: { medium: "210x180>", thumb: "50x45>" }, default_url: "/images/:style/conver_photo.png"
# validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
```
Lo cual debe quedar así:

```ruby
belongs_to :editorial
has_many :registros
has_many :authors, through: :registros
has_attached_file :cover_photo, styles: { medium: "210x180>", thumb: "50x45>" }, default_url: "/images/:style/conver_photo.png"
validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
```
Con eso listo, comiencen a testear el proyecto!