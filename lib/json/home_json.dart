import 'package:flutter/material.dart';

const String profileUrl =
    "https://img0.baidu.com/it/u=2266791864,792280171&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=458";
const String readyToday =
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F3527143%2F1ae5563104cad73868342314a03b81d4.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMzUyNzE0My8xYWU1NTYzMTA0Y2FkNzM4NjgzNDIzMTRhMDNiODFkNC5qcGc%3D%2Fsign%2F19c61b47a87652ba824eb079b8779340.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1727634364&t=f8be3b18d7e8e914d3cb707bbceb779b";

const List tags = [
  {"label": "Education", "color": Color(0xFF7871aa)},
  {"label": "Self-development", "color": Color(0xFF7fb069)},
  {"label": "Psychology", "color": Color(0xFFcc7e85)},
];

const List storeTags = [
  {"label": "Education", "color": Color(0xFF7871aa)},
  {"label": "Self-development", "color": Color(0xFF7fb069)},
  {"label": "Psychology", "color": Color(0xFFcc7e85)},
  {"label": "Fantasy", "color": Color(0xFF76818e)},
  {"label": "Adventures", "color": Color(0xFFcf4d6f)},
  {"label": "Science-fiction", "color": Color(0xFFc86fc9)},
  {"label": "Detectives", "color": Color(0xFF8f8073)}
];

const List specialForYouJson = [
  {
    // "img": "https://covers.openlibrary.org/b/id/12726999-L.jpg",
    "img": "lib/images/0012726999-L.jpg",
    "price": "5.00",
    "title": "Shatter me",
    "sub_title": "1st ed.",
    "author_name": "Tahereh Mafi",
    "rate": 4.31,
    "favourite": true,
    "page": "87",
    "about":
        "Pride and Prejudice by Jane Austen: Jane Austen's Pride and Prejudice is a timeless novel that delves into the complexities of love, class, and societal expectations in early 19th-century England. The story follows Elizabeth Bennet, a sharp-witted and independent young woman, as she navigates the challenges of finding a suitable marriage. Her path crosses with the enigmatic and seemingly aloof Mr. Darcy, leading to a series of misunderstandings fueled by pride and prejudice on both sides. As they gradually come to understand each other's true character, the novel explores themes of personal growth, the folly of judging others hastily, and the importance of love and respect in marriage. Austen's witty dialogue and keen observations of social manners make this novel a beloved classic that continues to resonate with readers today."
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/10362743-L.jpg",
    "img": "lib/images/0010362743-L.jpg",
    "price": "8.99",
    "title": "A Court of Thorns and Roses",
    "sub_title": "A Court of Thorns and Roses",
    "author_name": "Sarah J. Maas",
    "rate": 4.15,
    "favourite": false,
    "page": "263",
    "about":
        "Moby-Dick by Herman Melville: Moby-Dick by Herman Melville is a profound exploration of obsession, vengeance, and the human condition. The novel is narrated by Ishmael, a sailor who joins the whaling ship Pequod, captained by the enigmatic and monomaniacal Ahab. Ahab is consumed by his desire for revenge against Moby Dick, a colossal white whale that had previously destroyed Ahab’s ship and left him with a mutilated leg. As the Pequod sails across the vast oceans, the crew encounters various challenges, both external and internal, that test their limits. The novel delves deep into philosophical and existential themes, using the voyage as a metaphor for the human struggle against an indifferent universe. Melville’s rich language, complex characters, and allegorical depth have cemented Moby-Dick as a cornerstone of American literature."
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/8743774-L.jpg",
    "img": "lib/images/0008743774-L.jpg",
    "price": "3.40",
    "title": "Where the crawdads sing",
    "sub_title": "First large print edition.",
    "author_name": "Delia Owens",
    "rate": 3.20,
    "favourite": false,
    "page": "60",
    "about":
        "Crime and Punishment by Fyodor Dostoevsky: Crime and Punishment by Fyodor Dostoevsky is a psychological drama that explores the moral dilemmas and inner turmoil of its protagonist, Rodion Raskolnikov. Set in the gritty streets of 19th-century St. Petersburg, the novel follows Raskolnikov, an impoverished former student, as he devises a plan to murder a pawnbroker for her money. Believing that he can transcend ordinary moral laws, Raskolnikov commits the crime, but he is soon plagued by guilt and paranoia. The novel examines themes of redemption, the nature of evil, and the psychological impact of crime on the human psyche. Dostoevsky's exploration of Raskolnikov's fractured mind and his ultimate quest for redemption offers a profound insight into the complexities of morality and justice, making it a cornerstone of Russian literature."
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/10696993-L.jpg",
    "img": "lib/images/0010696993-L.jpg",
    "price": "5.99",
    "title": "The Seven Husbands of Evelyn Hugo",
    "sub_title": "A Novel",
    "author_name": "Taylor Jenkins Reid",
    "rate": 4.12,
    "favourite": true,
    "page": "872",
    "about":
        "The Great Gatsby by F. Scott Fitzgerald: F. Scott Fitzgerald’s The Great Gatsby is a poignant reflection on the American Dream and the moral decay of society during the Roaring Twenties. The novel is narrated by Nick Carraway, a young man who moves to Long Island and becomes entangled in the world of the wealthy and mysterious Jay Gatsby. Gatsby is famous for his lavish parties, but beneath his opulent lifestyle lies an unrequited love for Daisy Buchanan, Nick’s cousin. As Gatsby’s obsession with rekindling his romance with Daisy intensifies, the novel exposes the hollow pursuit of wealth and status, and the disillusionment that follows. Fitzgerald's lyrical prose and sharp social commentary paint a vivid picture of a society consumed by greed, ambition, and the pursuit of an unattainable ideal, making The Great Gatsby a defining work of American literature."
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/12567115-L.jpg",
    "img": "lib/images/0012567115-L.jpg",
    "price": "2.99",
    "title": "Reminders of Him",
    "sub_title": "A Novel",
    "author_name": "Colleen Hoover",
    "rate": 2.00,
    "favourite": false,
    "page": "76",
    "about":
        "1984 by George Orwell: George Orwell's 1984 is a dystopian novel that presents a chilling portrayal of a totalitarian society under the omnipresent surveillance of Big Brother. The story is set in a grim future where the Party, led by Big Brother, exercises absolute control over every aspect of life, including thought and behavior. The protagonist, Winston Smith, works at the Ministry of Truth, where he alters historical records to fit the Party's propaganda. Despite the oppressive regime, Winston harbors rebellious thoughts and begins a forbidden love affair, leading him to question the Party’s authority. The novel explores themes of censorship, the manipulation of truth, and the loss of individuality. Orwell’s stark warning about the dangers of totalitarianism and the erosion of personal freedoms has made 1984 a powerful and enduring cautionary tale that resonates deeply with modern readers."
  }
];

List reviewsPeople = [
  {
    "img":
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "name": "Miranda",
    "rate": 3.0,
    "text": "For once I actually thought Colleen wasn’t going to make me cry."
  },
  {
    "img":
        "https://images.unsplash.com/photo-1523701911984-474f3d34537b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "name": "Selena",
    "rate": 4.5,
    "text":
        "I wanted to give this book 5 stars but just couldn’t. There are so many f-bombs I almost stopped reading it but I kept at it. Glad I did too. But I will never read it again or listen to it because I don’t need that word in my mind. Why oh why is it so necessary to the story?"
  }
];

const List similarBooksJson = [
  {
    // "img": "https://covers.openlibrary.org/b/id/12860069-L.jpg",
    "img": "lib/images/0012860069-L.jpg",
    "price": "2.50",
    "title": "I'm Glad My Mom Died",
    "sub_title": "I'm Glad My Mom Died",
    "author_name": "Jennette McCurdy",
    "rate": 4.0,
    "favourite": false,
    "page": "200"
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/12842027-L.jpg",
    "img": "lib/images/0012842027-L.jpg",
    "price": "5.99",
    "title": "The Love Hypothesis",
    "sub_title": "The Love Hypothesis",
    "author_name": "Ali Hazelwood",
    "rate": 3.5,
    "favourite": false,
    "page": "150"
  },
  {
    // "img": "https://covers.openlibrary.org/b/id/402210-L.jpg",
    "img": "lib/images/402210-L.jpg",
    "price": "2.20",
    "title": "The 48 Laws of Power",
    "sub_title": "The 48 Laws of Power",
    "author_name": "Robert Greene",
    "rate": 4.07,
    "favourite": false,
    "page": "60"
  },
];
