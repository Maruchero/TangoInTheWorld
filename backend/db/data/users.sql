INSERT INTO
    users(
        `email`,
        `password`,
        `salt`,
        `first_name`,
        `last_name`,
        `phone`,
        `profile_picture`,
        `organization`,
        `website`,
        `permissions`,
        `default_language`
    )
VALUES (
        'administrator@tangointheworld.com',
        '$argon2i$v=19$m=16,t=2,p=1$MHlQN1JISTBzM2NxM0liSw$IpN5PKgFKG5165fXFZknsg',
        '0yP7RHI0s3cq3IbK',
        'Admin',
        'TangoInTheWorld',
        '+393791434721',
        '/media/profile_pictures/admin-picture.jpeg',
        'TangoInTheWorld',
        'http://tangointheworld.com',
        'admin',
        'en'
    )