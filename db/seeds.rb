# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../lib/user_profiles'

all_users = [
  {
    user_name: 'Omega3',
    email: 'omega3@gmail.com',
    password: 'password',
    location:'Collingwood, Melbourne',
    first_name: 'Rachael',
    last_name: 'Mac',
    social_link: '@omega3',
    image: 'https://i.imgur.com/lKqDn9T.jpeg',
    #spotify_id: ''
    pronoun: 'She/Her',
    description: "Rachael AKA Omega3 is 1/3 of local events
    collective, Merge Melbourne, home of
    femme & GNC club night 'Freakquency' and
    founder of The Daily Commute, an electronic music mix series. Omega3's sets are built around tension and release, driving
    floor fillers and spacey sounds, she flirts with a variety of styles and tempos but her forays into industrial techno and Melbourne minimal have become a calling card. Omega3 has continuously moved dancefloors across Melbourne at venues including Colour, Miscelliania, Rooftop Bar, Baxter’s Lot & The Rochester Hotel.",
    genre:'HOUSE TECHNO DISCO TRANCE ELECTRO MINIMAL',
    operator_type: 'DJ, Promoter, Booker'
  },
    {
      user_name: 'O Honey',
      password: 'password',
      email: 'honeyo@gmail.com',
      operator_type: 'DJ',
      location: 'Carlton, Melbourne',
      first_name: 'Honey',
      last_name: 'Dee',
      social_link: '@honey',
      image: 'https://i.imgur.com/iBSNyXe.png',
      # spotify_id: 'dj_test',
      pronoun: 'She/Her',
      description: "Effortlessly chic, O Honey’s mixes deliver petal-soft hooks, engaging rhythmic patterns and enduring quality. O Honey, started out playing her favourite dance, funk, soul, disco, hip hop and new wave records at local bars and parties in 2018. With a passion for matching the energy, she can always keep the boogie alive, bringing it upbeat or slowing it right down.From weddings and Christmas parties to popular Naarm bars and clubs, O Honey aspires to connect with people through good music, new and old, and create lasting memories on dance floors around Melbourne.",
      genres: 'HOUSE DISCO HIP HOP/R&B CORPORATE/PARTY FUNK/SOUL VINYL'
   }, 
   {  
    user_name: 'Tanika',
    password: 'password',
    email: 'tanika@gmail.com',
    operator_type: 'DJ',
    location: ' Footscary, Melbourne',
    first_name: 'Tanika',
    last_name: 'Smith',
    social_link: '@tanika',
    image: 'https://i.imgur.com/QEau6WV.jpg',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Renowned for her distinctive taste and adventurous track selection is Tinika, Melbourne based DJ and purveyor of fine Tunes. Fresh off the back of a career-changing set at Novel’s Bridge Rave, Tinika has quickly pushed her way to the front of the Melbourne electronic scene.",
    genres: 'HOUSE TECHNO DISCO HIP HOP/R&B CORPORATE/PARTY DEEP HOUSE'
  },
  {
    user_name: 'SourTooth',
    password: 'password',
    email: 'sourgal@gmail.com',
    operator_type: 'DJ',
    location: 'Preston, Melbourne',
    first_name: 'Sour',
    last_name: 'User',
    social_link: '@sourtooth',
    image: 'https://i.imgur.com/OBhqM40.png',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Listeners beware - you'll find yourself entranced by Sourtooths wave of funky riffs, vintage leads, crisp vocals and catchy rhythms. Eclectic and glitchy, Sourtooth presents the perfect balance of playfulness and warmth. Sourtooth is a Naarm based DJ who loves exploring the intersection between nostalgia and sound.
    Layering eclectic, glitchy melodies with driving beats, sourtooth blends a mix of sweet and sour house, techno and breaks - the perfect soundtrack for a memorable night on the dancefloor.",
    genres: 'HOUSE ELECTRO TECHNO'
  },
  {
    user_name: 'MFA',
    password: 'password',
    email: 'mfa@gmail.com',
    operator_type: 'DJ, ,  Booker',
    location: 'Fawkner, Melbourne',
    first_name: 'Mary',
    last_name: 'Faw',
    social_link: '@mfa',
    image: 'https://i.imgur.com/HkBEo8e.png',
    # spotify_id: 'dj_test',
    pronoun: 'they/them',
    description:'MFA has their fingers in many of Naarm’s scene pies - booker, promoter and strict trance DJ, MFA knows their way around a good time.
    Having managed multiple party venues and founded numerous events such as Temple Night Club, Trancendance & Thirstday’s, MFA is one is one to watch.',
    genres: 'TRANCE AMBIENT TECHNO'
  },
  {
    user_name: 'Afrodisiac',
    password: 'password',
    email: 'Afrodisiac@gmail.com',
    operator_type: 'DJ',
    location: 'St Kilda, Melbourne',
    first_name: 'Lucy',
    last_name: 'Afro',
    social_link: '@afrodisiac',
    image: 'https://i.imgur.com/GqpOIW7.jpg',
    # spotify_id: 'DJ',
    pronoun: 'She/Her',
    description: "Afrodisiac has made herself known to an extensive array of dancefloors around Naarm.Inspired by years of engaging on dance floors conducted by friends Gabby began DJing in 2018. Afrodisiac's track selections have a strong focus on exploring the Black Diaspora. Afrodisiac has mixed for music series such as Waiting for Utopia, Verve Zine and Douglas Street and radio stations such as SYN, Skylab and Pretend. Follow through to her socials to check them out!",
    genres: 'CORPORATE/PARTY AFRO HOUSE UK FUNKY DEEP HOUSE'
  },
    {
    user_name: 'IVANNA',
    password: 'password',
    email: 'ivanna@gmail.com',
    operator_type: 'DJ',
    location: 'Werribee, Melbourne',
    first_name: 'Ivanna',
    last_name: 'Leo',
    social_link: '@ivanna',
    image: 'https://i.imgur.com/IGyJGaS.png',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "IVAANA is based in Naarm/Melbourne and was lucky enough to be part of the DJ101 program gaining critical skills and experience performing. They have a keen interest in a broad range of genres, often focussing on electronic, tribal, percussive and lyrical sounds.Central to IVAANA's own learning and experience in creating an open, inclusive and collaborative environment for other queer DJ's/artists.",
    genres: 'HOUSE TECHNO EDM'
  },
  {
    user_name: 'Monfreaq',
    password: 'password',
    email: 'monfreaq@gmail.com',
    operator_type: 'DJ',
    location: 'Cranbourne, Melbourne',
    first_name: 'Molly',
    last_name: 'Jones',
    social_link: '@monfreaq',
    image: ' https://i.imgur.com/a2FG4jJ.jpg',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Monfreaq discovered her passion for DJing while living in the Netherlands and has since, in the space of 12 busy months, amassed support slots for the likes of DJ Koze, Bradley Zero and Denis Sulta, as well as appearances at Technoir, Daydreams, Novel, Revolver and Beyond The Valley. Her passion lies within heart-pumping electro, choppy breaks, and hedonistic techno with plenty of bass, creating a fast-paced, groove inducing and intense energy to get freaky to.",
    genres: 'HOUSE TECHNO DNB/JUNGLE OTHER'
  },
  {
    user_name: 'House Mum',
    password: 'password',
    email: 'housemum@gmail.com',
    operator_type: 'DJ',
    location: 'Franskton, Melbourne',
    first_name: 'Holly',
    last_name: 'Rogers',
    social_link: '@housemum',
    image: 'https://i.imgur.com/I40ETK6.png',
    # spotify_id: 'dj_test',
    pronoun: 'They/Them',
    description: "House Mum has made a name for themself with their signature blend of percussive techno, hard drum, and trance heard throughout their energetic DJ sets and recorded mixes.
    House Mum is a co-founder of Naarm-based group Fluxx, a DJ collective/label that focuses on diversity and exploring the darker side of club music within the local scene.",
    genres: 'HOUSE TECHNO EDM DNB/JUNGLE OTHER'
  },
  {
    user_name: 'Priya',
    password: 'password',
    email: 'priya@gmail.com',
    operator_type: 'DJ, Producer',
    location: 'Keilor Park, Melbourne',
    first_name: 'Priya',
    last_name: 'Anna',
    social_link: '@priya',
    image: 'https://i.imgur.com/mKHWtyx.png',
    # spotify_id: 'dj_test',
    pronoun: 'They/Them',
    description: "Priya is a Naarm/Melbourne producer (and aspiring DJ).Having always had a passion for music, from playing jazz trombone in their teens to finding their love for house and dance music when they left school, Priya's taste can most certainly be trusted. Only having produced since the start of 2020, Priya has honed their musical talent. Priya was lucky enough to release their first song, ‘When You're Gone’, through Love Above Records.",
    genres: 'DISCO FUNK/SOUL DEEP HOUSE DANCE HOUSE'
  },
  {
    user_name: 'Nay Nay',
    password: 'password',
    email: 'naya@gmail.com',
    operator_type: 'DJ',
    location: 'Croydon, Melbourne',
    first_name: 'Naomi',
    last_name: 'Jasper',
    social_link: '@naynay',
    image: 'https://i.imgur.com/3f7hFLk.png',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Dynamo deejay, NAY NAY, has certainly had her finger on the polyrhythmic pulse for quite sometime now. NayNay’s appreciation for a wide variety of electronic music swirls radiantly through her works, showcasing explorations of amapiano, dancehall, house, funk & afrobeats genres.NayNay’s signature style of afro bumpers and house thumpers leave a lasting impression on each and every dancefloor she encounters.",
    genres: 'AMAPIANO DANCEHALL HOUSE FUNK DANCE AFROBEATS'
  },
  {
    user_name: 'Liv Vicariously',
    password: 'password',
    email: 'Livvicariously@gmail.com',
    operator_type: 'DJ',
    location: 'Kensington, Melbourne',
    first_name: 'Olivia',
    last_name: 'Marks',
    social_link: '@livvicariously',
    image: 'https://i.imgur.com/qyAP675.png',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Visionary selector, Liv Vicariously takes you on a journey through space and euphoria. Her punchy bass and melodic blends take you to that ethereal place beyond the clouds.
    Illuminating an array of stages and platforms with her glossy sounds, Liv Vicariously has been warmly received by Area3000, Rooftop Bar, Rubix & The Daily Commute alike.",
    genres: 'HOUSE TECHNO DISCO ELECTRO CORPORATE/PARTY DEEP HOUSE'
  },
  {

    user_name: 'Toorak Cowboy',
    password: 'password',
    email: 'cowboy101@gmail.com',
    operator_type: 'DJ',
    location: 'Box Hill, Melbourne',
    first_name: 'Ben',
    last_name: 'Simmons',
    social_link: '@toorakcowboy',
    image: 'https://i.imgur.com/MT5pgqI.png',
    # spotify_id: 'dj_test',
    pronoun: 'He/They',
    description: "Toorak Cowboys track selections are a dancer's delight from start to finish. Having graced a number of stages across Melbourne including Rooftop bar, Massies, 303, Max Watt’s, House of Plants & Ferdy Derke - Toorak Cowboy’s confidence, contagious beats and confounding dance floor rhythms are sure to lasoo you in and leave you wanting more.",
    genres: 'HOUSE ITALO DISCO CORPORATE/PARTY'
  },
  {

    user_name: 'Yellow',
    password: 'password',
    email: 'yellow101@gmail.com',
    operator_type: 'DJ',
    location: 'North Melbourne, Melbourne',
    first_name: 'Tim',
    last_name: 'Shane',
    social_link: '@yellow',
    image: 'https://i.imgur.com/78yJfnl.png',
    # spotify_id: 'dj_test',
    pronoun: 'He/Him',
    description: "Disco King, YELLOW spreads rainbows and rhythmic sunshine across each and every dancefloor he touches. YELLOW comes armoured with a vast array of music knowledge that he effortlessly presents as a disco-house extravaganza time and time again.",
    genres: 'HOUSE DISCO ELECTRO CORPORATE/PARTY'
  },
  {
    user_name: 'Kayroy',
    password: 'password',
    email: 'kayroy@gmail.com',
    operator_type: 'DJ, Producer, Promoter, Booker',
    location: 'Cliffton Hill, Melbourne',
    first_name: 'Brain',
    last_name: 'Conner',
    social_link: '@kayroy',
    image: 'https://i.imgur.com/rbVzpZK.jpeg',
    # spotify_id: 'dj_test',
    pronoun: 'He/Him',
    description: "With a reputation for rambunctious DJ sets and an impressive slew of sampladelic releases, Kayroy artfully blends varied influences to deliver sets that are dynamic and exciting, venturing deep into the depths of the Cyborg Disco.
    A slew of acclaimed releases followed on both local and international labels including Sour Edits, Whisky Disco, Clipp.art and Hotfoot, showcasing his unique sampladelic production style, and cementing him as a mainstay of Melbourne’s dance-music community.",
    genre: 'TECHNO DISCO TRCHNO HIP HOP/ RNB LIVE CORPORATE/PARTY DEEP HOUSE'
  },
  {
    user_name: 'Merge',
    password: 'password',
    email: 'merge@gmail.com',
    operator_type: 'Promoter',
    location: 'Kensington, Melbourne',
    first_name: 'Alex',
    last_name: 'Charles',
    social_link: '@merge',
    image: 'https://i.imgur.com/jEDizHg.png',
    # spotify_id: 'dj_test',
    pronoun: 'Collective',
    description: "Merge is a Melbourne based femme music and events collective, founded by dancefloor connoisseurs Bree, Millie & Rachael.
    Merge aims to provide a safe and inclusive dancefloor that encourages people to express themselves, and where female and GNC talents are celebrated and championed.",
    genres: 'VENUE TAKE OVER NIGHT CLUB BUSH DOOF FESTIVAL'
  },
  {
    user_name: 'Endorphin',
    password: 'password',
    email: 'enodme@gmail.com',
    operator_type: 'DJ, Producer',
    location: 'Seddon, Melbourne',
    first_name: 'Kim',
    last_name: 'Mark',
    social_link: '@endorphin',
    image: 'https://i.imgur.com/pu0KRWR.jpg',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "A Naarm-based DJ, Endorfin (Kim) is unafraid to traverse between genres, styles and tempos, always bringing an element of surprise to her DJ sets. Her contagious energy behind the decks reflects her passion and love for the music she plays and is bound to get any crowd moving. Fresh on the scene, she has quickly made a name for herself and is one to watch!.",
    genres: 'HOUSE TECHNO DNB/JUNGLE TRANCE AMBIENT'
  },
  {  
    user_name: 'Mon Franco',
    password: 'password',
    email: 'monfranco@gmail.com',
    operator_type: 'DJ',
    location: 'Camberwell, Melbourne',
    first_name: 'Mon',
    last_name: 'Franks',
    social_link: '@monfranco',
    image: 'https://i.imgur.com/IlxIdKe.jpg  ',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Mon explores the electronic music scene, agile cross-genre sets and dance-floor chaos. They take great influence from their Filipino culture and upbringing. Inspired by queer sounds in their mixes, Mon can be found throwing events that prioritise safe accessible spaces that celebrate diversity in the LGBTQIA+ community, called Open Seen. Having studied Sound Production, Mon also works with young & upcoming artists with their music projects at Naarm based youth centres.",
    genres: 'HOUSE TECHNO HIP HOP/R&B EDM'
  },
  {
    user_name: 'Sophie Forrest',
    password: 'password',
    email: 'sophieft@gmail.com',
    operator_type: 'DJ, Producer, Promoter, Booker',
    location: 'Armdale, Melbourne',
    first_name: 'Sophie',
    last_name: 'Du',
    social_link: '@sophieforrest',
    image: 'https://i.imgur.com/mRwGOFK.png',
    # spotify_id: 'dj_test',
    pronoun: 'She/Her',
    description: "Experience jazz and soul fusions through South African born artist, label owner and promoter Sophie Forrest.
    Breaking barriers for genderqueer artists and supporting emerging communities, Sophie Forrest delivers untamed techno hues and nostalgic recollections of ultimate electro worlds.
    Exploring untouched corners on dance floors throughout the electronic circuit in Melbourne and beyond, Sophie Forrest has taken her catalogue and pinned guest spots across the map, while also having supported the likes of global tastemakers including Honey Dijon, Ben UFO, Boris, Roi Perez and DJ Sprinkles.",
    genres: 'HOUSE TECHNO DISCO HIP HOP/R&B FUNK/SOUL'
  },
  {
    user_name: 'Vitamin DJ',
    password: 'password',
    email: 'vitamind@gmail.com',
    operator_type: 'DJ',
    location: 'Broadmeadows, Melbourne',
    first_name: 'Victor',
    last_name: 'LI',
    social_link: '@vitamindj',
    image: 'https://i.imgur.com/k4CMVKe.png',
    # spotify_id: 'dj_test',
    pronoun: 'He/Him',
    description: "DJ extraordinaire, Vitamin DJ.
    Plucked fresh from Miscellania and a stellar turn at Ferdy Derke, Vitamin DJ has become known for their stellar techno sounds and spicy Rooftop Bar takeovers. A selector quickly carving a name for themselves amongst Melbourne’s ones to watch, Vitamin DJ will dose you up with a highly concentrated, protein-packed punch that will see you stomping your feet until the bitter end.",
    genres: 'HOUSE TECHNO TRANCE ELECTRO'
  },
  {
    user_name: 'Jarvis',
    password: 'password',
    email: 'jarvis101@gmail.com',
    operator_type: 'DJ',
    location: 'Braybrook, Melbourne',
    first_name: 'Jarvis',
    last_name: 'Berry',
    social_link: '@jarvis',
    image: 'https://i.imgur.com/kVynJWF.png',
    # spotify_id: 'dj_test',
    pronoun: 'He/Him',
    description: "Midsumma DJ and CLOSET day party regular, Jarv!s thrusts listeners into limitless, hi-octane sets interspersed with pop vocal cuts, early 2000's trance licks and hard-hitting acid house grooves.
    His music selections are almost as infectious as his stage presents... almost!",
    genres: 'HOUSE TECHNO DISCO HIP HOP/R&B FUNK/SOUL'
  },
]

# Booking.destroy_all
puts 'Destroying all users...'
User.destroy_all

puts 'Creating users...'

all_users.each do |user|
  profile = User.new
 
  profile.user_name = user[:user_name]
  profile.password = 'password'
  profile.password_confirmation = 'password'
  profile.email = user[:email]
  profile.operator_type = user[:operator_type]
  profile.location = user[:location]
  profile.first_name = user[:first_name]
  profile.last_name = user[:last_name]
  profile.social_link = user[:social_link]
  profile.image = user[:image]
  profile.pronoun = user[:pronoun]
  profile.description = user[:description]
  profile.genres = user[:genres]

  profile.save!
  puts "#User {profile.id} created!"
end

puts "Seeding done."
