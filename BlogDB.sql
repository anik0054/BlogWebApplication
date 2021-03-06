USE [master]
GO
/****** Object:  Database [BlogDB]    Script Date: 6/12/2015 10:55:43 PM ******/
CREATE DATABASE [BlogDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlogDB] SET  MULTI_USER 
GO
ALTER DATABASE [BlogDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BlogDB]
GO
/****** Object:  Table [dbo].[ArticleTable]    Script Date: 6/12/2015 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArticleTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[HitCounter] [int] NOT NULL,
 CONSTRAINT [PK_ArticleTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 6/12/2015 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommentTable]    Script Date: 6/12/2015 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommentTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CommentTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 6/12/2015 10:55:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ArticleTable] ON 

INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1, N'VALENTINUS', N'&lt;p&gt;When questioned regarding the personal elements in his lifelong interest in matters Gnostic, Professor Gilles Quispel, the noted Gnostic expert and associate of C.G. Jung, tells a remarkable story. During the dark and hopeless years of World War II, when life and the world seemed lacking in hope and joy, Quispel turned to the study of the message of the great Gnostic teacher and poet, Valentinus. The inspiration, comfort, and faith derived from the writings of Valentinus were instrumental in turning Quispel into a devoted and thoroughly sympathetic scholar of Gnosticism. It would not be a gross exaggeration to state that the experience of the Dutch scholar is far from unique and that numerous persons in our contemporary world are finding the message of this greatest of all Gnostic teachers of eminent and helpful relevance in their lives.&lt;/p&gt;

&lt;p&gt;G.R.S. Mead, the great early translator and theosophical interpreter of Gnostic documents, called Valentinus &amp;quot;the great unknown&amp;quot; of Gnosticism, and indeed it is true that we do not possess much information regarding his life and personality. He was born in Africa, probably within the territory of the ancient city of Carthage, around or before 100 A.D. He was educated in Alexandria and in the prime of his years transferred his residence to Rome, where he achieved a high degree of prominence in the Christian community between 135 and 160 A.D. Tertullian wrote that Valentinus was a candidate for the office of bishop of Rome and that he lost the election by a rather narrow margin. This same failed orthodox church father (Tertullian himself joined the heresy of Montanism) alleges that Valentinus fell into apostasy around 175 A.D. There is much evidence indicating, however, that he was never universally condemned as a heretic in his lifetime and that he was a respected member of the Christian community until his death. He was almost certainly a priest in the mainstream church and may even have been a bishop.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.gnosis.org/images/valentinus1.jpg&quot; style=&quot;height:100px; width:316px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4AF016333A4 AS DateTime), 1, 1, N'Published', 13)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (3, N'C. G. Jung and the Alchemical Renewal', N'&lt;p&gt;The lovely little town of Knittlingen, near the Black Forrest in West Germany, is noted far-and-wide as the original residence of the famed Dr. Johannes Faustus. A plaque in the small but exquisite museum devoted to the facts and legends concerning Dr. Faust tells us that, although alchemy has often been considered a pseudo-science based on the pretense that gold could be made from other metals, it is now known that, in reality, it was a spiritual art having as its aim the psychological transformation of the alchemist himself. This public statement, viewed daily by large numbers of visitors, demonstrates most impressively the rehabilitated image alchemy has acquired in recent decades. This positive change is due in large measure to the work of one remarkable man: Carl Gustav Jung.&lt;/p&gt;

&lt;p&gt;When Jung published his first major work on alchemy at the end of World War II, most reference books described this discipline as nothing more than a fraudulent and inefficient forerunner of modern chemistry. Today, more than twenty-five years after Jung&amp;#39;s death, alchemy is once again a respected subject of both academic and popular interest, and alchemical terminology is used with great frequency in textbooks of depth-psychology and other disciplines. It may be said without exaggeration that the contemporary status of alchemy owes its very existence to the psychological wizard of K&amp;uuml;snacht. Take away the monumental contribution of C.G. Jung, and most modern research concerning this fascinating subject falls like a house of cards; to speak of alchemy in our age and not mention him could be likened to discoursing on Occultism without noting the importance of Helena P. Blavatsky, or discussing religious studies in contemporary American universities without paying homage to Mircea Eliade.&lt;/p&gt;

&lt;p&gt;Jung&amp;#39;s &amp;quot;first love&amp;quot; among esoteric systems was Gnosticism. From the earliest days of his scientific career until the time of his death, his dedication to the subject of Gnosticism was relentless. As early as August, 1912, Jung intimated in a letter to Freud that he had an intuition that the essentially feminine-toned archaic wisdom of the Gnostics, symbolically called&amp;nbsp;&lt;em&gt;Sophia&lt;/em&gt;, was destined to re-enter modern Western culture by way of depth-psychology. Subsequently, he stated to Barbara Hannah that when he discovered the writings of the ancient Gnostics, &amp;quot;I felt as if I had at last found a circle of friends who understood me.&amp;quot;&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.gnosis.org/images/jung_alchemyA.jpg&quot; style=&quot;height:268px; width:224px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4AF00FA7724 AS DateTime), 2, 2, N'Published', 3)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (4, N'Pop and Circumstance', N'&lt;p&gt;For us Americans, popular culture is the sea in which we swim. In ever accelerating fashion, the old distinctions between so-called high culture (opera, classical music, fine art, theatre, and &amp;quot;serious&amp;quot; literature) and popular culture (movies, TV, pop music, &amp;quot;trash&amp;quot; fiction, and everything from monster truck races to folk art) have evaporated. What is left is simply pop culture: the spectacular onslaught of rock operas, CD-ROM porn, NEA-funded performance art in nightclubs, infotainment, 900 numbers, celebrity journalism, Tina Brown&amp;#39;s&lt;em&gt;New Yorker,&lt;/em&gt;&amp;nbsp;John Wayne Bobbitt&amp;#39;s penis, Nancy Kerrigan&amp;#39;s knee, Allen Ginsberg in Gap ads, Shirley MacLaine as spiritual adviser, Rush Limbaugh as political oracle, and on and on.&lt;/p&gt;

&lt;p&gt;Like most contemporary Americans, I was raised on a steady diet of popular culture. When I was young, I prized my stacks of comics and Mad magazines, went to sleep at night with my earplug crystal radio tuned to the local Top 40 station, and parroted lines from TV commercials in unison with my grade-school classmates. The Beatles and the rest of the British Invasion arrived in full force when I was thirteen, the perfect age to experience Beatlemania firsthand.&lt;/p&gt;

&lt;p&gt;In high school I joined the ranks of science fiction fandom, found profundities in Robert Heinlein&amp;#39;s&amp;nbsp;&lt;em&gt;Stranger in a Strange Land,&lt;/em&gt;&amp;nbsp;and orated on the metaphysics of Jimi Hendrix&amp;#39;s first album for senior honors English class. The story is much the same for my college and art school years: I quickly became a published underground cartoonist and began producing pop artifacts as well as consuming them.&lt;/p&gt;

&lt;p&gt;Of course I was operating with the comforting assumption that the pop artifacts that I was producing were part of a countercultural project doing battle with the insidious brain-numbing pop artifacts of mainstream culture. However, it only took the passage of twenty years and a few trips to other parts of the globe to realize that these distinctions were lost on most non-Americans. From their point of view, this was all American stuff, exuding that American naivete and vitality which the rest of the world finds so amusing. Pop was pop, and parts is parts, as the commercial goes.&lt;/p&gt;

&lt;p&gt;Fast forward to 1994 and the GNOSIS office. Here we sit contemplating the hazardous interaction of popular culture and the esoteric. Does popularization cheapen that which it spreads? Can the subtleties of the ineffable survive the gauntlet of the assembly line and market place? When did the commercialization of the New Age reach the point of no return? Is this very magazine an example of that which it decries? Good questions all, and here we sit contemplating them in our navel-gazing way when&amp;nbsp;&lt;em&gt;The PoMo Tarot&lt;/em&gt;&amp;nbsp;arrives.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://cps-static.rovicorp.com/3/JPG_400/MI0002/999/MI0002999072.jpg?partner=allrovi.com&quot; style=&quot;height:400px; width:398px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(0x0000A4AF00FB26EC AS DateTime), 2, 1, N'Published', 2)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1002, N'Heaven, Earth, and Us', N'&lt;p&gt;Many wonderful things,&amp;quot; wrote the poet Sophocles, &amp;quot;and none more wonderful than man&amp;quot; - lines that could also be translated, &amp;quot;Many terrible things, and none more terrible than man.&amp;quot;(1)&lt;/p&gt;

&lt;p&gt;The modern age proves the truth of these words. According to the current wisdom, our air conditioners are causing mutations in the antipodes, our taste for hamburgers is wiping out the rain forests, and our quest for Lebensraum is displacing hundreds of plant and animal species that never did us any harm. Ecologists have even usurped an old alchemical term - albedo or &amp;quot;whiteness&amp;quot; - to characterize the blanket of concrete and asphalt that is replacing greenery on the earth&amp;#39;s surface.&lt;/p&gt;

&lt;p&gt;With the vertiginous array of claims about environmental depredations churned out every day by organizations as diverse as UNESCO, the Sierra Club, and an outfit altruistically espousing &amp;quot;voluntary human extinction,&amp;quot;(2) it seems hard to avoid the conclusion that the relations between humanity and its home planet are somewhat strained. Spokesmen for various branches of spirituality have joined the crusade, warning us that we are doing nothing less heinous than committing an act of rape on Mother Earth.&lt;/p&gt;

&lt;p&gt;And yet I find myself strangely ambivalent about the environmental question. On the one hand, the evidence seems palpable enough. If I don&amp;#39;t want to believe facts and figures, it&amp;#39;s hard to miss the foul air, the eroding hillsides, the disappearance of open space. On the other hand, the ecological movement often displays such sanctimoniousness, guilt-tripping, and negativity that I find myself more repelled than persuaded by its tactics. As ecopsychologist Theodore Roszak, author of&amp;nbsp;&lt;em&gt;The Voice of the Earth,&lt;/em&gt;&amp;nbsp;said in a recent address, ecological activists &amp;quot;have shown little concern for the emotional toxic waste they have left behind.&amp;quot;&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://revelationsofprofoundlove.com/wp-content/uploads/2013/04/Let-us-create-heaven-on-earth-300x230.jpg&quot; style=&quot;height:230px; width:300px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4AF015F2D90 AS DateTime), 1, 2, N'Published', 2)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1003, N'Hermes and Hermeticism Throughout the Ages', N'&lt;p&gt;There are few names to which more diverse persons and disciplines lay claim than the term &amp;quot;Hermetic.&amp;quot; Alchemists ancient and contemporary apply the adjective &amp;quot;Hermetic&amp;quot; to their art, while magicians attach the name to their ceremonies of evocation and invocation. Followers of Meister Eckhart, Raymond Lull, Paracelsus, Jacob Boehme, and most recently Valentin Tomberg are joined by academic scholars of esoterica, all of whom attach the word &amp;quot;Hermetic&amp;quot; to their activities.&lt;/p&gt;

&lt;p&gt;Who, then, was Hermes, and what may be said of the philosophy or religion that is connected with him? The early twentieth-century scholar Walter Scott, in his classic edition of the Hermetic texts, writes of a legend preserved by the Renaissance writer Vergicius:&lt;/p&gt;

&lt;blockquote&gt;
&lt;p&gt;They say that this Hermes left his own country and traveled all over the world&amp;hellip;; and that he tried to teach men to revere and worship one God alone, &amp;hellip;the&amp;nbsp;&lt;em&gt;demiurgus&lt;/em&gt;&amp;nbsp;and&amp;nbsp;&lt;em&gt;genetor&lt;/em&gt;&amp;nbsp;[begetter] of all things; &amp;hellip;and that he lived a very wise and pious life, occupied in intellectual contemplation&amp;hellip;, and giving no heed to the gross things of the material world&amp;hellip;; and that having returned to his own country, he wrote at the time many books of mystical theology and philosophy.&lt;a href=&quot;http://www.gnosis.org/hermes.htm#notes&quot;&gt;1&lt;/a&gt;&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;Until relatively recently, no one had a clear picture of either the authorship or the context of the mysterious writings ascribed to Hermes. Descriptions such as the one above are really no more than a summary of the ideal laid down in the &amp;quot;Hermetic&amp;quot; writings. The early Christian Fathers, in time, mostly held that Hermes was a great sage who lived before Moses and that he was a pious and wise man who received revelations from God that were later fully explained by Christianity. None mentioned that he was a Greek god.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.gnosis.org/images/hermes1.gif&quot; style=&quot;height:225px; width:225px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4AF01750944 AS DateTime), 1, 3, N'Published', 11)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1004, N'The Top Functional Foods of 2010', N'&lt;p&gt;As the new year unfolds, functional foods are on target to be hotter than ever. The functional food industry got its start in the 1980s, and it&amp;rsquo;s been growing steadily since then with a projected growth rate of 56 percent from 2008 to 2011.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;What do functional foods mean?&lt;/strong&gt;&amp;nbsp;According to the April 2009 position on functional foods by the American Dietetic Association (ADA), all foods are functional at some level, because they provide nutrients that furnish energy, sustain growth, or maintain and repair vital processes. While the &amp;quot;functional food&amp;quot; category, per se, is not officially recognized by the Food and Drug Administration, the ADA considers functional foods to be whole foods and fortified, enriched, or enhanced foods that have a potentially beneficial effect on health. Thus a list of functional foods might be as varied as nuts, calcium-fortified orange juice, energy bars, bottled teas and gluten-free foods. While many functional foods&amp;mdash;from whole grain breads to wild salmon&amp;mdash;provide obvious health benefits, other functional foods like acai berry or &amp;quot;brain development&amp;quot; foods may make overly optimistic promises. Thus, it&amp;rsquo;s important to evaluate each functional food on the basis of scientific evidence before you buy into their benefits.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;What&amp;rsquo;s driving the interest in functional foods?&lt;/strong&gt;&amp;nbsp;Barbara Katz, president of HealthFocus International, a nutrition market research company based in St. Petersburg, FL, believes that consumers are more savvy regarding their health. People no longer receive all of their health advice at the doctor&amp;rsquo;s office; they now take control. And this is reflected in their shopping habits, as people purchase more foods with health benefits. &amp;quot;One of the biggest trends is the increase in control shoppers want over their own health. Shoppers now want to be a part of the dialogue and are increasingly going to the Internet and to one another to seek answers to questions and gather information about health,&amp;quot; adds Katz.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.ift.org/~/media/food%20technology/feature%20images/2012/04/top%2010%20functional%20food%20trends/figure1amongconsumersw.jpg&quot; style=&quot;height:392px; width:344px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4B0015A1C4C AS DateTime), 1, 1, N'Published', 5)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1021, N'Dalagang Bukid', N'&lt;p&gt;&lt;em&gt;Dalagang Bukid&lt;/em&gt;&amp;nbsp;is a story about a young flower vendor named Angelita (&lt;a href=&quot;https://en.wikipedia.org/wiki/Atang_de_la_Rama&quot;&gt;Atang de la Rama&lt;/a&gt;), who is forced by her parents to marry a wealthy old man, Don Silvestre, despite her love for Cipriano, a law student.&lt;/p&gt;

&lt;p&gt;Angelita&amp;#39;s parents are blind to her reciprocated love for Cipriano, as their shortage of money and consumption by various vices (gambling and cock-fighting) make Don Silvestre&amp;#39;s offer of marriage attractive. Don Silvestre is an old loan shark who visits cabarets and buys flowers from pretty young florists like Angelita. .&lt;/p&gt;

&lt;p&gt;Meanwhile, Angelita and her brothers, who are working as shoe shiners at the threshold of the Church of the Holy cross, maintain the expenses of the house (and their parents&amp;#39; vices) with their labor. Don Silvestre, meanwhile, offers to arrange for Angelita to win a beauty contest in &amp;quot;La Vanguardia&amp;quot; in exchange for her hand in marriage. Her parents accept the offer and the date of the wedding is set for the next day, which will see the formal crowning of Angelita as the beauty queen.&lt;/p&gt;

&lt;p&gt;However, Cipriano, who has just finished his studies, goes to Angelita&amp;#39;s house just in time to prevent Angeita from entering Don Silvestre&amp;#39;s car, which was to take her to the coronation ceremony. Instead of going to the event, Angelita and Cipriano go to the church, where they are wed in. After the wedding, they go to the coronation event together and announce their union as husband and wife. Don Silvestre faints upon learning the news.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;https://upload.wikimedia.org/wikipedia/en/e/e9/Dalagangbukid.jpg&quot; style=&quot;height:477px; width:365px&quot; /&gt;&lt;/p&gt;
', CAST(0x0000A4B20085CA64 AS DateTime), 1, 1, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1022, N'La Joute', N'&lt;p&gt;The ensemble of bronze sculptures contains a central&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Fountain&quot;&gt;fountain&lt;/a&gt;&amp;nbsp;surrounded by a number of freestanding abstract animal and&lt;span style=&quot;line-height:1.6&quot;&gt;&amp;nbsp;human figures inside and outside the fountain basin.&lt;/span&gt;&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Jp-riopelle-joute.jpg/300px-Jp-riopelle-joute.jpg&quot; style=&quot;height:198px; line-height:20.7999992370605px; width:300px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;The fountain operates on a&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Kinetic_sculpture&quot;&gt;kinetic&lt;/a&gt;&amp;nbsp;sequence that takes about 32 minutes to complete. It begins a few minutes before the half hour, every hour from 7 to 11 p.m. during the summer. The sequence starts when the fountain jet expands to form a dome over the sculptures. Then at the back end of the park the grates on the ground start to mist. The 12 grates each mist, one after the other in sequence, taking about 90 seconds to sequence from one to another until they reach the fountain. After about 18 minutes, machines inside the fountain start to produce a particularly dense cloud. The fountain jet then turns into a dribble. On the hour, nozzles in a ring surrounding the central sculpture within the basin shoot up jets of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Natural_gas&quot;&gt;natural gas&lt;/a&gt;&amp;nbsp;through the water; these are lit by flame sources installed in the daises of some of the sculptures, producing a dramatic ring of flame. The flame lasts for about seven minutes. The fountain itself stops. The misting stops, and then the fire is &amp;quot;doused&amp;quot; by the fountain which has restarted. The mist sequence, without the fire in the fountain, occurs every hour throughout the day.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(0x0000A4B2007C3B84 AS DateTime), 1, 1, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1023, N'Sri Lankan Tamil dialects', N'&lt;p&gt;The&amp;nbsp;&lt;strong&gt;Sri Lankan Tamil dialects&lt;/strong&gt;&amp;nbsp;or&amp;nbsp;&lt;strong&gt;Ceylon Tamil dialects&lt;/strong&gt;&amp;nbsp;form a group of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Tamil_language&quot;&gt;Tamil&lt;/a&gt;&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dialect&quot;&gt;dialects&lt;/a&gt;&amp;nbsp;used in the modern country of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sri_Lanka&quot;&gt;Sri Lanka&lt;/a&gt;&amp;nbsp;by&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sri_Lankan_Tamil_people&quot;&gt;Sri Lankan Tamil people&lt;/a&gt;&amp;nbsp;that is distinct from the dialects of modern Tamil spoken in&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Tamil_Nadu&quot;&gt;Tamil Nadu&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Kerala&quot;&gt;Kerala&lt;/a&gt;&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/States_and_territories_of_India&quot;&gt;states&lt;/a&gt;&amp;nbsp;of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/India&quot;&gt;India&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Sri_Lanka_Native_Tamil.svg/150px-Sri_Lanka_Native_Tamil.svg.png&quot; style=&quot;height:212px; line-height:20.7999992370605px; width:150px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Tamil dialects are differentiated by the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Phonological_change&quot;&gt;phonological changes&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sound_shift&quot;&gt;sound shifts&lt;/a&gt;&amp;nbsp;in their evolution from&amp;nbsp;&lt;/p&gt;

&lt;p&gt;classical or&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Old_Tamil&quot;&gt;Old Tamil&lt;/a&gt;&amp;nbsp;(300 BC - 700 CE). It is broadly categorized into three sub groups: Jaffna Tamil, Batticaloa Tamil and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Negombo_Tamil_dialect&quot;&gt;Negombo Tamil&lt;/a&gt;&amp;nbsp;dialects. These dialects are also used by ethnic groups other than Tamils such as&lt;a href=&quot;https://en.wikipedia.org/wiki/Sinhalese_people&quot;&gt;Sinhalese people&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sri_Lankan_Moors&quot;&gt;Sri Lankan Moors&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Vedda_people&quot;&gt;Veddas&lt;/a&gt;, who consider them to be distinct. These dialects are not mutually intelligible with Indian Tamil Dialects,&lt;a href=&quot;https://en.wikipedia.org/wiki/Sri_Lankan_Tamil_dialects#cite_note-1&quot;&gt;[1]&lt;/a&gt;&amp;nbsp;which some of the native speakers consider to be a separate language.&lt;/p&gt;
', CAST(0x0000A4B2007CA178 AS DateTime), 1, 4, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1024, N'Jamaica at the 1992 Summer Olympics', N'&lt;h2&gt;Medalists[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=1&quot;&gt;edit&lt;/a&gt;]&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Jamaica.svg/180px-Flag_of_Jamaica.svg.png&quot; style=&quot;height:90px; width:180px&quot; /&gt;&lt;/h2&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Silver_medal.svg&quot;&gt;&lt;img alt=&quot;Silver medal.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Silver_medal.svg/16px-Silver_medal.svg.png&quot; style=&quot;height:16px; width:16px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Silver[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=2&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Cuthbert&quot;&gt;Juliet Cuthbert&lt;/a&gt;&amp;nbsp;&amp;mdash; Athletics, Women&amp;#39;s 100 metres&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Cuthbert&quot;&gt;Juliet Cuthbert&lt;/a&gt;&amp;nbsp;&amp;mdash; Athletics, Women&amp;#39;s 200 metres&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Winthrop_Graham&quot;&gt;Winthrop Graham&lt;/a&gt;&amp;nbsp;&amp;mdash; Athletics, Men&amp;#39;s 400 metres Hurdles&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Bronze_medal.svg&quot;&gt;&lt;img alt=&quot;Bronze medal.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Bronze_medal.svg/16px-Bronze_medal.svg.png&quot; style=&quot;height:16px; width:16px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Bronze[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=3&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Merlene_Ottey-Page&quot;&gt;Merlene Ottey-Page&lt;/a&gt;&amp;nbsp;&amp;mdash; Athletics, Women&amp;#39;s 200 metres&lt;/li&gt;
&lt;/ul&gt;

&lt;h2&gt;Results by event[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=4&quot;&gt;edit&lt;/a&gt;]&lt;/h2&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Athletics_pictogram.svg&quot;&gt;&lt;img alt=&quot;Athletics pictogram.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Athletics_pictogram.svg/30px-Athletics_pictogram.svg.png&quot; style=&quot;height:30px; width:30px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Athletics[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=5&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;p&gt;Main article:&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Athletics_at_the_1992_Summer_Olympics&quot;&gt;Athletics at the 1992 Summer Olympics&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 100 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Ray_Stewart_(athlete)&quot;&gt;Ray Stewart&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 10.61&lt;/li&gt;
	&lt;li&gt;Quarterfinals &amp;mdash; 10.36&lt;/li&gt;
	&lt;li&gt;Semifinals &amp;mdash; 10.33&lt;/li&gt;
	&lt;li&gt;Final &amp;mdash; 10.22 (&amp;rarr; 7th place)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 200 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Clive_Wright&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Clive Wright&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 20.98&lt;/li&gt;
	&lt;li&gt;Quarterfinals &amp;mdash; 20.70&lt;/li&gt;
	&lt;li&gt;Semifinals &amp;mdash; 20.82 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 400 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Devon_Morris&quot;&gt;Devon Morris&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 46.45&lt;/li&gt;
	&lt;li&gt;Quarterfinals &amp;mdash; 45.67 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dennis_Blake&quot;&gt;Dennis Blake&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 45.92&lt;/li&gt;
	&lt;li&gt;Quarterfinals &amp;mdash; 46.49 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Anthony_Wallace_(athlete)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Anthony Wallace&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 46.88 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 800 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Clive_Terrelonge&quot;&gt;Clive Terrelonge&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 1:46.64&lt;/li&gt;
	&lt;li&gt;Semifinals &amp;mdash; 1:51.03 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 4&amp;times;100 m Relay&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Michael_Green_(sprinter)&quot;&gt;Michael Green&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Rudolph_Mighty&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Rudolph Mighty&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Anthony_Wallace_(athlete)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Anthony Wallace&lt;/a&gt;, and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Ray_Stewart_(athlete)&quot;&gt;Ray Stewart&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; DNF (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 4&amp;times;400m Relay&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dennis_Blake&quot;&gt;Dennis Blake&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Devon_Morris&quot;&gt;Devon Morris&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Howard_Davis_(runner)&quot;&gt;Howard Davis&lt;/a&gt;, and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Patrick_O%27Connor_(athlete)&quot;&gt;Patrick O&amp;#39;Connor&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; DSQ (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 110m Hurdles&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Richard_Bucknor&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Richard Bucknor&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heats &amp;mdash; 13.91&lt;/li&gt;
	&lt;li&gt;Quarterfinals &amp;mdash; 14.22 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Anthony_Knight&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Anthony Knight&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heats &amp;mdash; 14.12 (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 400m Hurdles&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Winthrop_Graham&quot;&gt;Winthrop Graham&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 48.51&lt;/li&gt;
	&lt;li&gt;Semifinal &amp;mdash; 47.62&lt;/li&gt;
	&lt;li&gt;Final &amp;mdash; 47.66 (&amp;rarr;&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Med_2.png&quot;&gt;&lt;img alt=&quot;Med 2.png&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/2/25/Med_2.png&quot; style=&quot;height:16px; width:16px&quot; /&gt;&lt;/a&gt;&amp;nbsp;&lt;strong&gt;Silver Medal&lt;/strong&gt;)&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Mark_Thompson_(athlete)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Mark Thompson&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; DSQ (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;br /&gt;
&lt;strong&gt;Women&amp;#39;s 100 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Cuthbert&quot;&gt;Juliet Cuthbert&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Merlene_Ottey&quot;&gt;Merlene Ottey&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dahlia_Duhaney&quot;&gt;Dahlia Duhaney&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 200 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Cuthbert&quot;&gt;Juliet Cuthbert&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Merlene_Ottey&quot;&gt;Merlene Ottey&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Grace_Jackson&quot;&gt;Grace Jackson&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 400 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sandie_Richards&quot;&gt;Sandie Richards&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Campbell_(Jamaican_sprinter)&quot;&gt;Juliet Campbell&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Claudine_Williams&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Claudine Williams&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 100m Hurdles&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Gillian_Russell&quot;&gt;Gillian Russell&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dionne_Rose&quot;&gt;Dionne Rose&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Michelle_Freeman&quot;&gt;Michelle Freeman&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 400m Hurdles&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Deon_Hemmings&quot;&gt;Deon Hemmings&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 55.48&lt;/li&gt;
	&lt;li&gt;Semifinal &amp;mdash; 54.70&lt;/li&gt;
	&lt;li&gt;Final &amp;mdash; 55.58 (&amp;rarr; 7th place)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 4&amp;times;100 m Relay&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Michelle_Freeman&quot;&gt;Michelle Freeman&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Cuthbert&quot;&gt;Juliet Cuthbert&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dahlia_Duhaney&quot;&gt;Dahlia Duhaney&lt;/a&gt;, and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Merlene_Ottey&quot;&gt;Merlene Ottey&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s 4&amp;times;400 m Relay&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Catherine_Pomales-Scott&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Catherine Pomales-Scott&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Cathy_Rattray-Williams&quot;&gt;Cathy Rattray-Williams&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Juliet_Campbell_(Jamaican_sprinter)&quot;&gt;Juliet Campbell&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sandie_Richards&quot;&gt;Sandie Richards&lt;/a&gt;, and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Claudine_Williams&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Claudine Williams&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Women&amp;#39;s Long Jump&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dionne_Rose&quot;&gt;Dionne Rose&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; 6.22 m (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Diane_Guthrie-Gresham&quot;&gt;Diane Guthrie-Gresham&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;Heat &amp;mdash; NM (&amp;rarr; did not advance)&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Boxing_pictogram.svg&quot;&gt;&lt;img alt=&quot;Boxing pictogram.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Boxing_pictogram.svg/30px-Boxing_pictogram.svg.png&quot; style=&quot;height:30px; width:30px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Boxing[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=6&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;p&gt;Main article:&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Boxing_at_the_1992_Summer_Olympics&quot;&gt;Boxing at the 1992 Summer Olympics&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Light Flyweight (&amp;ndash; 48&amp;nbsp;kg)&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/St._Aubyn_Hines&quot;&gt;St. Aubyn Hines&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;First Round &amp;mdash; Lost to&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Pramuansak_Phosuwan&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Pramuansak Phosuwan&lt;/a&gt;&amp;nbsp;(THA), RSC-2&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Lightweight (&amp;ndash; 60&amp;nbsp;kg)&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Delroy_Leslie&quot;&gt;Delroy Leslie&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;First Round &amp;mdash; Lost to&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Shigeyuki_Dobashi&quot;&gt;Shigeyuki Dobashi&lt;/a&gt;&amp;nbsp;(JPN), 5:11&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Cycling_(road)_pictogram.svg&quot;&gt;&lt;img alt=&quot;Cycling (road) pictogram.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Cycling_%28road%29_pictogram.svg/30px-Cycling_%28road%29_pictogram.svg.png&quot; style=&quot;height:30px; width:30px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Cycling[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=7&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;p&gt;Main article:&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Cycling_at_the_1992_Summer_Olympics&quot;&gt;Cycling at the 1992 Summer Olympics&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Individual Road Race&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Michael_McKay_(cyclist)&quot;&gt;Michael McKay&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Arthur_Tenn&quot;&gt;Arthur Tenn&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Sprint 1,000 metres&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Andrew_Myers_(cyclist)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Andrew Myers&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s 1,000 metres Time Trial&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Andrew_Myers_(cyclist)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Andrew Myers&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Sailing_pictogram.svg&quot;&gt;&lt;img alt=&quot;Sailing pictogram.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Sailing_pictogram.svg/30px-Sailing_pictogram.svg.png&quot; style=&quot;height:30px; width:30px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Sailing[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=8&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;p&gt;Main article:&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sailing_at_the_1992_Summer_Olympics&quot;&gt;Sailing at the 1992 Summer Olympics&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Two Person Dinghy&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Andrew_Gooding_(sailor)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Andrew Gooding&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Robert_Quinton&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Robert Quinton&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;h3&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/File:Table_tennis_pictogram.svg&quot;&gt;&lt;img alt=&quot;Table tennis pictogram.svg&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Table_tennis_pictogram.svg/30px-Table_tennis_pictogram.svg.png&quot; style=&quot;height:30px; width:30px&quot; /&gt;&lt;/a&gt;&amp;nbsp;Table Tennis[&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Jamaica_at_the_1992_Summer_Olympics&amp;amp;action=edit&amp;amp;section=9&quot;&gt;edit&lt;/a&gt;]&lt;/h3&gt;

&lt;p&gt;Main article:&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Table_tennis_at_the_1992_Summer_Olympics&quot;&gt;Table tennis at the 1992 Summer Olympics&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Men&amp;#39;s Singles&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Michael_Hyatt_(table_tennis)&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Michael Hyatt&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
', CAST(0x0000A4B2007D32C8 AS DateTime), 1, 5, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1025, N'Political division', N'&lt;p&gt;A&amp;nbsp;&lt;strong&gt;political division&lt;/strong&gt;&amp;nbsp;is a geographic&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Region&quot;&gt;region&lt;/a&gt;&amp;nbsp;accepted to be in the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Jurisdiction_(area)&quot;&gt;jurisdiction&lt;/a&gt;&amp;nbsp;of a particular&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Government&quot;&gt;governmental&lt;/a&gt;&amp;nbsp;entity. The particular government entity varies as each organizes its operations by further divisions (subdivisions of the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/State_(polity)&quot;&gt;state&lt;/a&gt;) to further its tasks and satisfy its responsibilities.&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/World_administrative_levels.png/260px-World_administrative_levels.png&quot; style=&quot;height:171px; width:260px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;On the large scale, a political division is typically a&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sovereign_state&quot;&gt;sovereign state&lt;/a&gt;&amp;nbsp;(colloquially referred to as &amp;quot;&lt;a href=&quot;https://en.wikipedia.org/wiki/Country&quot;&gt;country&lt;/a&gt;&amp;quot;), while on a smaller scale political divisions (sometimes called&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Administrative_division&quot;&gt;administrative divisions&lt;/a&gt;) include:&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Federated_states&quot;&gt;federated states&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/County&quot;&gt;counties&lt;/a&gt;&amp;nbsp;or&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Parish_(disambiguation)&quot;&gt;parishes&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Districts&quot;&gt;districts&lt;/a&gt;&amp;nbsp;or&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Provinces&quot;&gt;provinces&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/City&quot;&gt;cities&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Town&quot;&gt;towns&lt;/a&gt;&amp;nbsp;as well as&lt;/li&gt;
	&lt;li&gt;smaller municipalities such as boros, towns, townships, districts, provinces, and other similar names which are also defined by the cognizant&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Nation-state&quot;&gt;nation-state&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;Other names for such units in various contexts include &amp;quot;Subnational entity&amp;quot;, &amp;quot;administrative unit&amp;quot;, &amp;quot;administrative area&amp;quot;, &amp;quot;province&amp;quot;, &amp;quot;district&amp;quot; and &amp;quot;regional government&amp;quot;. Overall, all such distinctions are also called&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Subnational_entities&quot;&gt;subnational entities&lt;/a&gt;&amp;nbsp;by the United Nations. It is common to see political divisions drawn out on&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Political_map&quot;&gt;political maps&lt;/a&gt;.&lt;/p&gt;
', CAST(0x0000A4B2007F4B80 AS DateTime), 1, 4, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1026, N'Political division', N'&lt;p&gt;A&amp;nbsp;&lt;strong&gt;political division&lt;/strong&gt;&amp;nbsp;is a geographic&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Region&quot;&gt;region&lt;/a&gt;&amp;nbsp;accepted to be in the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Jurisdiction_(area)&quot;&gt;jurisdiction&lt;/a&gt;&amp;nbsp;of a particular&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Government&quot;&gt;governmental&lt;/a&gt;&amp;nbsp;entity. The particular government entity varies as each organizes its operations by further divisions (subdivisions of the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/State_(polity)&quot;&gt;state&lt;/a&gt;) to further its tasks and satisfy its responsibilities.&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/World_administrative_levels.png/260px-World_administrative_levels.png&quot; style=&quot;height:171px; width:260px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;On the large scale, a political division is typically a&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sovereign_state&quot;&gt;sovereign state&lt;/a&gt;&amp;nbsp;(colloquially referred to as &amp;quot;&lt;a href=&quot;https://en.wikipedia.org/wiki/Country&quot;&gt;country&lt;/a&gt;&amp;quot;), while on a smaller scale political divisions (sometimes called&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Administrative_division&quot;&gt;administrative divisions&lt;/a&gt;) include:&lt;/p&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Federated_states&quot;&gt;federated states&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/County&quot;&gt;counties&lt;/a&gt;&amp;nbsp;or&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Parish_(disambiguation)&quot;&gt;parishes&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Districts&quot;&gt;districts&lt;/a&gt;&amp;nbsp;or&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Provinces&quot;&gt;provinces&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/City&quot;&gt;cities&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Town&quot;&gt;towns&lt;/a&gt;&amp;nbsp;as well as&lt;/li&gt;
	&lt;li&gt;smaller municipalities such as boros, towns, townships, districts, provinces, and other similar names which are also defined by the cognizant&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Nation-state&quot;&gt;nation-state&lt;/a&gt;.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;Other names for such units in various contexts include &amp;quot;Subnational entity&amp;quot;, &amp;quot;administrative unit&amp;quot;, &amp;quot;administrative area&amp;quot;, &amp;quot;province&amp;quot;, &amp;quot;district&amp;quot; and &amp;quot;regional government&amp;quot;. Overall, all such distinctions are also called&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Subnational_entities&quot;&gt;subnational entities&lt;/a&gt;&amp;nbsp;by the United Nations. It is common to see political divisions drawn out on&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Political_map&quot;&gt;political maps&lt;/a&gt;.&lt;/p&gt;
', CAST(0x0000A4B2007E2FE8 AS DateTime), 1, 4, N'Published', 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (1028, N'Gonzales, Texas', N'&lt;p&gt;&lt;strong&gt;Gonzales&lt;/strong&gt;&amp;nbsp;is a city in&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales_County,_Texas&quot;&gt;Gonzales County&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Texas&quot;&gt;Texas&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/United_States&quot;&gt;United States&lt;/a&gt;. The population was 7,237 at the 2010 census. It is the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/County_seat&quot;&gt;county seat&lt;/a&gt;&amp;nbsp;of&amp;nbsp;Gonzales County.&amp;nbsp;&lt;img alt=&quot;&quot; class=&quot;right&quot; src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Come_And_Take_It_Mural.jpg/220px-Come_And_Take_It_Mural.jpg&quot; style=&quot;height:223px; width:220px&quot; /&gt;&lt;/p&gt;

&lt;p&gt;Gonzales is one of the earliest Anglo-American settlements in Texas, the first west of the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Colorado_River_(Texas)&quot;&gt;Colorado River&lt;/a&gt;. It was established by&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Empresario&quot;&gt;Empresario&lt;/a&gt;&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Green_DeWitt&quot;&gt;Green DeWitt&lt;/a&gt;&amp;nbsp;as the capital of his colony in August 1825. DeWitt named the community for&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Rafael_Gonz%C3%A1les&quot;&gt;Rafael Gonz&amp;aacute;les&lt;/a&gt;, governor of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Coahuila_y_Tejas&quot;&gt;Coahuila y Tejas&lt;/a&gt;.&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales,_Texas#cite_note-5&quot;&gt;[5]&lt;/a&gt;&amp;nbsp;Informally, the community was known as the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Dewitt_Colony&quot;&gt;Dewitt Colony&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;The original settlement (located where Highway 90-A crosses Kerr Creek) was abandoned in 1826 after two American Indian attacks. It was rebuilt nearby in 1827. The town remains today as it was originally surveyed.&lt;/p&gt;

&lt;p&gt;Gonzales is most famous as the &amp;quot;&lt;a href=&quot;https://en.wikipedia.org/wiki/Lexington,_Massachusetts&quot;&gt;Lexington&lt;/a&gt;&amp;nbsp;of Texas&amp;quot; because it was the site of the first skirmish of the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Texas_Revolution&quot;&gt;Texas Revolution&lt;/a&gt;. In 1831, the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Mexico&quot;&gt;Mexican&lt;/a&gt;&amp;nbsp;government had granted Green DeWitt&amp;#39;s request for a small cannon for protection against Indian attacks. At the outbreak of disputes between the Anglo settlers and the Mexican authorities in 1835, a contingent of more than 100 Mexican soldiers was sent from San Antonio to retrieve the cannon.&lt;/p&gt;

&lt;p&gt;When the soldiers arrived, there were only 18 men in Gonzales, but they refused to return the cannon, and soon men from the surrounding area joined them.&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Texian&quot;&gt;Texians&lt;/a&gt;&amp;nbsp;under the command of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Old_Three_Hundred&quot;&gt;John H. Moore&lt;/a&gt;&amp;nbsp;confronted&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Francisco_de_Casta%C3%B1eda&quot;&gt;them&lt;/a&gt;. Sarah DeWitt and her daughter sewed a flag bearing the likeness of the cannon and the words &amp;quot;Come and Take It,&amp;quot; which was flown when the first shots of Texan independence were fired on October 2, 1835. The Texians successfully resisted the Mexican troops in what became known as the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Battle_of_Gonzales&quot;&gt;Battle of Gonzales&lt;/a&gt;.&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales,_Texas#cite_note-davis142-6&quot;&gt;[6]&lt;/a&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales,_Texas#cite_note-7&quot;&gt;[7]&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;Gonzales later contributed 32 men from the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales_Ranging_Company&quot;&gt;Gonzales Ranging Company&lt;/a&gt;&amp;nbsp;to the defense of the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Alamo_Mission_in_San_Antonio&quot;&gt;Alamo&lt;/a&gt;.&lt;a href=&quot;https://en.wikipedia.org/wiki/Gonzales,_Texas#cite_note-edmondson340-8&quot;&gt;[8]&lt;/a&gt;&amp;nbsp;It was the only city to send aid to the Alamo and all 32 men lost their lives defending the Alamo. It was to Gonzales that&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Susanna_Dickinson&quot;&gt;Susanna Dickinson&lt;/a&gt;, widow of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Almaron_Dickinson&quot;&gt;one&lt;/a&gt;&amp;nbsp;of the Alamo defenders, and Joe, the slave of&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/William_B._Travis&quot;&gt;William B. Travis&lt;/a&gt;, fled with news of the Alamo massacre. General&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Sam_Houston&quot;&gt;Sam Houston&lt;/a&gt;&amp;nbsp;was there organizing the Texas forces. He anticipated the town would be the next target of General&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Antonio_L%C3%B3pez_de_Santa_Anna&quot;&gt;Antonio L&amp;oacute;pez de Santa Anna&lt;/a&gt;&amp;#39; Mexican army. Gathering the Texians at Peach Creek east of town, under the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/w/index.php?title=Sam_Houston_Oak&amp;amp;action=edit&amp;amp;redlink=1&quot;&gt;Sam Houston Oak&lt;/a&gt;, Houston ordered Gonzales burned, to deny it to the enemy. He began a retreat toward the U.S. border. The widows and orphans of Gonzales and their neighbors were forced to flee, thus precipitating the&amp;nbsp;&lt;a href=&quot;https://en.wikipedia.org/wiki/Runaway_Scrape&quot;&gt;Runaway Scrape&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;The town was derelict immediately after the Texas Revolution, but was eventually rebuilt on the original site throughout the early 1840s. By 1850, the town had a population of 300. The population rose to 1,703 in the 1860 census, 2,900 by the mid-1880s, and 4,297 in 1900. Part of the growth of the late 19th century can be attributed to the arrival of various immigrants, among them Jews, many of whom became peddlers and merchants&lt;/p&gt;
', CAST(0x0000A4B2007F45A4 AS DateTime), 1, 1, N'Published', 0)
SET IDENTITY_INSERT [dbo].[ArticleTable] OFF
SET IDENTITY_INSERT [dbo].[CategoryTable] ON 

INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (1, N'Arts')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (2, N'Science')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (3, N'History')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (4, N'Politics')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (5, N'Sports')
SET IDENTITY_INSERT [dbo].[CategoryTable] OFF
SET IDENTITY_INSERT [dbo].[CommentTable] ON 

INSERT [dbo].[CommentTable] ([Id], [Content], [DateTime], [ArticleId], [UserId]) VALUES (1, N'Wow', CAST(0x0000A4AF01749FCC AS DateTime), 1, 1007)
INSERT [dbo].[CommentTable] ([Id], [Content], [DateTime], [ArticleId], [UserId]) VALUES (2, N'Awesome', CAST(0x0000A4AF017F9D78 AS DateTime), 1003, 1008)
INSERT [dbo].[CommentTable] ([Id], [Content], [DateTime], [ArticleId], [UserId]) VALUES (3, N'Wow', CAST(0x0000A4B0014D960C AS DateTime), 1003, 2)
INSERT [dbo].[CommentTable] ([Id], [Content], [DateTime], [ArticleId], [UserId]) VALUES (4, N'Wow', CAST(0x0000A4B00167F538 AS DateTime), 1004, 1)
SET IDENTITY_INSERT [dbo].[CommentTable] OFF
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1, N'anik', N'123', N'Anik Islam', N'anik@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (2, N'rahim', N'123', N'Rahim', N'rahim@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1002, N'asif', N'123', N'Asif', N'asif@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1003, N'rafid', N'123', N'Rafid', N'rafid@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1004, N'arif', N'123', N'Arif', N'arif@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1005, N'ahmed', N'123', N'Ahmed', N'ahmed@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1006, N'kamal', N'123', N'Kamal', N'kamal@gmail.cm')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1007, N'sakib', N'123', N'Sakib Ahmed', N'sakib@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1008, N'maruf', N'123', N'Maruf Hossain', N'maruf@gmail.com')
INSERT [dbo].[UserTable] ([Id], [UserName], [Password], [Name], [Email]) VALUES (1009, N'sadman', N'123', N'Sadman', N'sadman@emal.com')
SET IDENTITY_INSERT [dbo].[UserTable] OFF
/****** Object:  Index [IX_ArticleTable]    Script Date: 6/12/2015 10:55:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ArticleTable] ON [dbo].[ArticleTable]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryTable]    Script Date: 6/12/2015 10:55:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CategoryTable] ON [dbo].[CategoryTable]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentTable]    Script Date: 6/12/2015 10:55:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CommentTable] ON [dbo].[CommentTable]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserTable]    Script Date: 6/12/2015 10:55:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserTable] ON [dbo].[UserTable]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserTable_1]    Script Date: 6/12/2015 10:55:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserTable_1] ON [dbo].[UserTable]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArticleTable]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTable_CategoryTable] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryTable] ([Id])
GO
ALTER TABLE [dbo].[ArticleTable] CHECK CONSTRAINT [FK_ArticleTable_CategoryTable]
GO
ALTER TABLE [dbo].[ArticleTable]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTable_UserTable] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserTable] ([Id])
GO
ALTER TABLE [dbo].[ArticleTable] CHECK CONSTRAINT [FK_ArticleTable_UserTable]
GO
ALTER TABLE [dbo].[CommentTable]  WITH CHECK ADD  CONSTRAINT [FK_CommentTable_ArticleTable] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleTable] ([Id])
GO
ALTER TABLE [dbo].[CommentTable] CHECK CONSTRAINT [FK_CommentTable_ArticleTable]
GO
ALTER TABLE [dbo].[CommentTable]  WITH CHECK ADD  CONSTRAINT [FK_CommentTable_UserTable] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserTable] ([Id])
GO
ALTER TABLE [dbo].[CommentTable] CHECK CONSTRAINT [FK_CommentTable_UserTable]
GO
USE [master]
GO
ALTER DATABASE [BlogDB] SET  READ_WRITE 
GO
