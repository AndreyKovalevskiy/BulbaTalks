  The document contains a draft list of screens and functionality, which will be used in BulbaTalks app. 
<br>The screens were used from the Twitter app and  most of  them were modified. The original versions of the screens are given at the end of the document. 

| Launch                         |  |
| :----------------------        | :-----|
| | TBD: the team is deciding which logo to create. Start-up screen displaying a BulbaTalks logo.|
| **Authorization**              |  |
|![](/docs/architecture/images/auth.jpg)            | Allows an authorized Twitter User to access to his private account.|
| **Profile**                    |  |
|![](/docs/architecture/images/profile.jpg)         | Contains information about User e.g.: <br>-	account name; <br>-	@name (an unique identification of account);<br>-	day of registration in app.<br>User has an access to thumbnail presentation of all his Tweets and can open the desired Tweet. Also, the User could add a new Tweet by tapping on the button «Tweet»<br>From here User can navigate to the settings of his Profile and to the list of Following/Followers.|
| **Edit profile**               |  |
|![](/docs/architecture/images/edit.jpg)            | Allows to load a header/profile photo and to change personal information.|
| **Following/Followers**.       |  |
|![](/docs/architecture/images/following.jpg)       | Displays the list of Following/Followers.<br> In these screens User could follow/unfollow selected account by tapping on the button «Following».|
|![](/docs/architecture/images/followers.jpg).      |  |
| **Follow profile**             |  |
|![](/docs/architecture/images/followingProfile.jpg)| Contains personal information of  Twitter User (the same information like in the Profile screen).<br> Allows follow/unfollow this account by tapping on the button «Following».|
| **List of Tweets**             |  |
|![](/docs/architecture/images/list.jpg)            | Displays a list of Tweets from accounts User has chosen to follow on.<br>In this screen User could:<br> 1.	Scroll Tweets.<br> 2.	Comment, retweet and like a Tweet.<br> 3.	Add a new Tweet by tapping on the button «Tweet».<br> 4.	Go up the list by clicking on the Home icon.<br> 5.	Go to the Search screen.<br> 6.	Open the sidebar menu by clicking on the User’s  photo or by swiping the screen from left to right.|
| **Sidebar menu**               |  |
|![](/docs/architecture/images/sidebar.jpg)         | From here User can navigate to the Profile, to the list of Following/Followers and to the settings of his account.|
| **Tweet**                      |  |
|![](/docs/architecture/images/newTweet.jpg).       | Allows to create a new Tweet by entering a message (up to 280 characters) and to add an image or a location. |
| **Location**                   |  |
|![](/docs/architecture/images/location.jpg).       | Displays the current location of  User and allows to search a required address.|
| **Selected Tweet**             |  |
|![](/docs/architecture/images/tweet.jpg)           | Displays selected Tweet.<br>User could comment, retweet and like a selected Tweet.|
| **Comment**                    |  |
|![](/docs/architecture/images/comment.jpg)         | Allows to comment a selected Tweet and to add an image or a location .|
| **Search**                     |  |
|![](/docs/architecture/images/search.jpg)          | Contains the search box at the top of the page in which the User could enter his search query. Results will show a combination of Tweets, accounts.<br>From here the User can navigate to the Twitter timeline.|
| **Settings**                   |  |
|                                | TBD: the team is thinking about a screen layout.<br>Allows to change a language and  to log out of app.|

The original versions of the screens:

| Profile          | Following           | Follow Profile         | List of Tweets |
| :--------------- | :---------------    | :----------------------| :--------------|
|![](/docs/architecture/images/original/originalProfile.jpg) | ![](/docs/architecture/images/original/originalFollowing.jpg) | ![](/docs/architecture/images/original/originalFollowingProfile.jpg) | ![](/docs/architecture/images/original/originalList.jpg) |
|**Sidebar menu**  | **Tweet**| **Selected Tweet** | **Comment** |
|![](/docs/architecture/images/original/originalSidebar.jpg) | ![](/docs/architecture/images/original/originalNewTweet.jpg) | ![](/docs/architecture/images/original/originalTweet.jpg) | ![](/docs/architecture/images/original/originalComment.jpg) |
|**Search**        |                     |                        |                |
|![](/docs/architecture/images/original/originalSearch.jpg) | | | |
