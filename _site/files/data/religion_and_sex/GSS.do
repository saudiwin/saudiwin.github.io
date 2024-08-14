#delimit ;

   infix
      ballot   1 - 20
      bible    21 - 40
      prayer   41 - 60
      spden16  61 - 80
      sprel16  81 - 100
      spfund   101 - 120
      sprel    121 - 140
      fund16   141 - 160
      denom16  161 - 180
      relig16  181 - 200
      neargod  201 - 220
      pray     221 - 240
      postlife 241 - 260
      health   261 - 280
      xmovie   281 - 300
      partners 301 - 320
      sexornt  321 - 340
      evstray  341 - 360
      sexsex5  361 - 380
      partnrs5 381 - 400
      nummen   401 - 420
      numwomen 421 - 440
      sexfreq  441 - 460
      paidsex  461 - 480
      pikupsex 481 - 500
      acqntsex 501 - 520
      frndsex  521 - 540
      matesex  541 - 560
      reliten  561 - 580
      attend   581 - 600
      fund     601 - 620
      sex      621 - 640
      degree   641 - 660
      educ     661 - 680
      age      681 - 700
      childs   701 - 720
      sibs     721 - 740
      spwrksta 741 - 760
      divorce  761 - 780
      martype  781 - 800
      marital  801 - 820
      wrkstat  821 - 840
      id_      841 - 860
      race     861 - 880
      reg16    881 - 900
      hompop   901 - 920
      other    921 - 940
      denom    941 - 960
      relig    961 - 980
      spkhomo  981 - 1000
      spkath   1001 - 1020
      govcare  1021 - 1040
      equal1   1041 - 1060
      natfarez 1061 - 1080
      partyid  1081 - 1100
      rincome  1101 - 1120
      income   1121 - 1140
      babies   1141 - 1160
      year     1161 - 1180
using GSS.dat;

label variable ballot   "Ballot used for interview";
label variable bible    "Feelings about the bible";
label variable prayer   "Bible prayer in public schools";
label variable spden16  "Denomination in which spouse raised";
label variable sprel16  "Religion in which spouse raised";
label variable spfund   "How fundamentalist is spouse currently";
label variable sprel    "Spouses religious preference";
label variable fund16   "How fundamentalist was r at age 16";
label variable denom16  "Denomination in which r was raised";
label variable relig16  "Religion in which raised";
label variable neargod  "How close does r feel to god";
label variable pray     "How often does r pray";
label variable postlife "Belief in life after death";
label variable health   "Condition of health";
label variable xmovie   "Seen x-rated movie in last year";
label variable partners "How many sex partners r had in last year";
label variable sexornt  "Sexual orientation";
label variable evstray  "Have sex other than spouse while married";
label variable sexsex5  "Sex of sex partners last five years";
label variable partnrs5 "How many sex partners r had in last 5 years";
label variable nummen   "Number of male sex partners since 18";
label variable numwomen "Number of female sex partners since 18";
label variable sexfreq  "Frequency of sex during last year";
label variable paidsex  "R had sex for pay last year";
label variable pikupsex "R had sex with casual date last year";
label variable acqntsex "R had sex with acquaintance last year";
label variable frndsex  "R had sex with friend last year";
label variable matesex  "Was 1 of rs partners spouse or regular";
label variable reliten  "Strength of affiliation";
label variable attend   "How often r attends religious services";
label variable fund     "How fundamentalist is r currently";
label variable sex      "Respondents sex";
label variable degree   "Rs highest degree";
label variable educ     "Highest year of school completed";
label variable age      "Age of respondent";
label variable childs   "Number of children";
label variable sibs     "Number of brothers and sisters";
label variable spwrksta "Spouse labor force status";
label variable divorce  "Ever been divorced or separated";
label variable martype  "Marital type";
label variable marital  "Marital status";
label variable wrkstat  "Labor force status";
label variable id_      "Respondent id number";
label variable race     "Race of respondent";
label variable reg16    "Region of residence, age 16";
label variable hompop   "Number of persons in household";
label variable other    "Other protestant denominations";
label variable denom    "Specific denomination";
label variable relig    "Rs religious preference";
label variable spkhomo  "Allow homosexual to speak";
label variable spkath   "Allow anti-religionist to speak";
label variable govcare  "Govt concern for social welfare";
label variable equal1   "Everyone should look out for self";
label variable natfarez "Caring for the poor -- version z";
label variable partyid  "Political party affiliation";
label variable rincome  "Respondents income";
label variable income   "Total family income";
label variable babies   "Household members less than 6 yrs old";
label variable year     "Gss year for this respondent                       ";


label define gsp001x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp002x
   9        "No answer"
   8        "Don't know"
   4        "Other"
   3        "Book of fables"
   2        "Inspired word"
   1        "Word of god"
   0        "Not applicable"
;
label define gsp003x
   9        "No answer"
   8        "Don't know"
   2        "Disapprove"
   1        "Approve"
   0        "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in usa"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelic luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp005x
   9        "No answer"
   8        "Dont know"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp006x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp007x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp008x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp009x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp010x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp011x
   9        "No answer"
   8        "Don't know"
   5        "Does not believe"
   4        "Not close at all"
   3        "Not very close"
   2        "Somewhat close"
   1        "Extremely close"
   0        "Not applicable"
;
label define gsp012x
   9        "No answer"
   8        "Don't know"
   6        "Never"
   5        "Lt once a week"
   4        "Once a week"
   3        "Several times a week"
   2        "Once a day"
   1        "Several times a day"
   0        "Not applicable"
;
label define gsp013x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp014x
   9        "No answer"
   8        "Don't know"
   4        "Poor"
   3        "Fair"
   2        "Good"
   1        "Excellent"
   0        "Not applicable"
;
label define gsp015x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp016x
   99       "No answer"
   98       "Don't know"
   95       "Several"
   9        "1 or more, # unknown"
   8        "More than 100 partners"
   7        "21-100 partners"
   6        "11-20 partners"
   5        "5-10 partners"
   4        "4 partners"
   3        "3 partners"
   2        "2 partners"
   1        "1 partner"
   0        "No partners"
   -1       "Not applicable"
;
label define gsp017x
   9        "No answer"
   8        "Dont know"
   3        "Heterosexual or straight"
   2        "Bisexual"
   1        "Gay, lesbian, or homosexual"
   0        "Not applicable"
;
label define gsp018x
   9        "No answer"
   8        "Don't know"
   3        "Never married"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp019x
   9        "No answer"
   8        "Don't know"
   3        "Exclusively female"
   2        "Both male and female"
   1        "Exclusively male"
   0        "Not applicable"
;
label define gsp020x
   99       "No answer"
   98       "Don't know"
   95       "Several"
   9        "1 or more, # unknown"
   8        "More than 100 partners"
   7        "21-100 partners"
   6        "11-20 partners"
   5        "5-10 partners"
   4        "4 partners"
   3        "3 partners"
   2        "2 partners"
   1        "1 partner"
   0        "No partners"
   -1       "Not applicable"
;
label define gsp021x
   999      "No answer"
   998      "Don't know"
   997      "Refused"
   996      "N.a"
   995      "Many,lots"
   994      "Several"
   993      "Garbled text"
   992      "X"
   991      "Some,1+"
   990      "Dash or slash"
   989      "989 or higher"
   -1       "Not applicable"
;
label define gsp022x
   999      "No answer"
   998      "Don't know"
   997      "Refused"
   996      "N.a"
   995      "Many,lots"
   994      "Several"
   993      "Garbled text"
   992      "X"
   991      "Some,1+"
   990      "Dash or slash"
   989      "989 or higher"
   -1       "Not applicable"
;
label define gsp023x
   9        "No answer"
   8        "Don't know"
   6        "4+ per week"
   5        "2-3 per week"
   4        "Weekly"
   3        "2-3 times a month"
   2        "Once a month"
   1        "Once or twice"
   0        "Not at all"
   -1       "Not applicable"
;
label define gsp024x
   9        "No answer"
   8        "Don't know"
   2        "Not selected"
   1        "Had sex for pay"
   0        "Not applicable"
;
label define gsp025x
   9        "No answer"
   8        "Don't know"
   2        "Not selected"
   1        "Had sex with pick-up"
   0        "Not applicable"
;
label define gsp026x
   9        "No answer"
   8        "Don't know"
   2        "Not selected"
   1        "Sex w acquaintance"
   0        "Not applicable"
;
label define gsp027x
   9        "No answer"
   8        "Don't know"
   2        "Not selected"
   1        "Had sex with friend"
   0        "Not applicable"
;
label define gsp028x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp029x
   9        "No answer"
   8        "Don't know"
   4        "No religion"
   3        "Somewhat strong"
   2        "Not very strong"
   1        "Strong"
   0        "Not applicable"
;
label define gsp030x
   9        "Dk,na"
   8        "More thn once wk"
   7        "Every week"
   6        "Nrly every week"
   5        "2-3x a month"
   4        "Once a month"
   3        "Sevrl times a yr"
   2        "Once a year"
   1        "Lt once a year"
   0        "Never"
;
label define gsp031x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp032x
   2        "Female"
   1        "Male"
;
label define gsp033x
   9        "No answer"
   8        "Don't know"
   7        "Not applicable"
   4        "Graduate"
   3        "Bachelor"
   2        "Junior college"
   1        "High school"
   0        "Lt high school"
;
label define gsp034x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp035x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp036x
   9        "Dk na"
   8        "Eight or more"
;
label define gsp037x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp038x
   9        "No answer"
   8        "Other"
   7        "Keeping house"
   6        "School"
   5        "Retired"
   4        "Unempl, laid off"
   3        "Temp not working"
   2        "Working parttime"
   1        "Working fulltime"
   0        "Not applicable"
;
label define gsp039x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp040x
   2        "Marriage between people of the same gender"
   1        "Marriage between a man and a woman"
   0        "Not applicable"
;
label define gsp041x
   9        "No answer"
   5        "Never married"
   4        "Separated"
   3        "Divorced"
   2        "Widowed"
   1        "Married"
;
label define gsp042x
   9        "No answer"
   8        "Other"
   7        "Keeping house"
   6        "School"
   5        "Retired"
   4        "Unempl, laid off"
   3        "Temp not working"
   2        "Working parttime"
   1        "Working fulltime"
   0        "Not applicable"
;
label define gsp043x
   3        "Other"
   2        "Black"
   1        "White"
   0        "Not applicable"
;
label define gsp044x
   9        "Pacific"
   8        "Mountain"
   7        "W. sou. central"
   6        "E. sou. central"
   5        "South atlantic"
   4        "W. nor. central"
   3        "E. nor. central"
   2        "Middle atlantic"
   1        "New england"
   0        "Foreign"
;
label define gsp045x
   99       "No answer"
   98       "Don't know"
;
label define gsp046x
   999      "No answer"
   998      "Don't know"
   217      "Old Testament"
   216      "Word of Jesus"
   215      "Armenian Apostolic Church"
   214      "Hebrew Israelites"
   213      "Hebrew Roots"
   212      "Scandinavian Church"
   211      "Disciple of Jesus"
   210      "Ethiopian Evangelical Church"
   209      "Church of the Living God"
   208      "Calvary"
   207      "The Legacy Church"
   206      "The Amana Church"
   205      "Assembly of Christ"
   204      "Universal Church of the Kingdom of God"
   203      "Warehouse Ministries"
   202      "Messianic Christian"
   201      "Pathways Christian Church"
   200      "North Country Chapel"
   199      "Follower of Christ"
   198      "New Life"
   197      "Grace Independent Baptist Church"
   196      "Empowerment Temple"
   195      "The Ark Church"
   194      "Jacobite Syrian Christian Church"
   193      "Free Spirit Ministry"
   192      "New Thought"
   191      "Faith Covenant"
   190      "Faith Fellowship"
   189      "Family Life Church"
   188      "Metropolitan Community"
   187      "New Apostolic"
   186      "National Progressive Baptist"
   185      "Journeys"
   184      "Church of God of Israel"
   183      "Jacobite Apostolic"
   182      "Alliance"
   181      "Born Again"
   180      "Shield of Faith Ministries"
   179      "Great Faith Ministries"
   178      "Cathedral of Joy"
   177      "Real Life Ministries"
   176      "Vineyard Church"
   175      "Greater New Testament Church"
   174      "Shephard's Chapel"
   173      "Harvest Church"
   172      "Word of Faith Church"
   171      "Life Sanctuary"
   170      "Cornerstone Church"
   169      "The Word Church"
   168      "Rain on Us Deliverance Ministries"
   167      "Sanctuary"
   166      "United Christian"
   165      "Church of the Living God"
   164      "Divine Science"
   163      "Swedenurgian/Churches of the New Jerusalem"
   162      "Reformed Church of Jesus Christ of Latter Day Saints"
   161      "Hawaiian Ohana"
   160      "Friends in Christ"
   159      "Community Christian Fellowship"
   158      "New Hope Christian Fellowship"
   157      "Community of Christ"
   156      "Church of Living Christ"
   155      "Christian Union"
   154      "Spirit Filled"
   153      "Unity of the Brethren"
   152      "Course in Miracles"
   151      "World Overcomer Outreach Ministry"
   150      "Zwinglian"
   149      "Polish Catholic"
   148      "Schwenkfelder"
   146      "Laotian Christian"
   145      "Church of Jesus Christ of the Restoration"
   144      "Spirit of Christ"
   143      "Assyrian Evangelist Church"
   142      "Unity School of Christianity"
   141      "New Birth Christian"
   140      "People's Church"
   139      "Faith Christian"
   138      "Apostolic Church"
   137      "New Song"
   136      "New Age Spirituality"
   135      "Chinese Gospel Church"
   134      "Independent Fundamental Church of America"
   133      "Primitive Baptist"
   132      "Brother of Christ"
   131      "Macedonia"
   130      "True Light Church of Christ"
   129      "Living Word"
   128      "Christian Tabernacle"
   127      "Church of Daniel's Band"
   126      "Carmelite"
   125      "Christian Calvary Chapel"
   124      "Faith Gospel Tabernacle"
   123      "Polish National Church"
   122      "Chapel of Faith"
   121      "The Church of God of Prophecy"
   120      "Evangelical United Brethren"
   119      "United Church of Canada"
   118      "The Way Ministry"
   117      "Missionary Church"
   116      "Church of the First Born"
   115      "Mennonite Brethren"
   114      "Church Universal and Triumphant"
   113      "Worldwide Church of God"
   112      "Evangelical Methodist"
   111      "Amish"
   110      "Calvary Bible"
   109      "Bible Missionary"
   108      "Christ Cathedral of Truth"
   107      "Apostolic Christian"
   106      "Triumph Church of God"
   105      "Latvian Lutheran"
   104      "House of Prayer"
   103      "Pentecostal Apostolic"
   102      "Charismatic"
   101      "Christ in God"
   100      "Grace Brethren"
   99       "American Reform"
   98       "Federated Church"
   97       "Other Fundamentalist"
   96       "United Church of Christianity"
   95       "Unity"
   94       "Swedish Mission"
   93       "Missionary Baptist"
   92       "Mission Covenant"
   91       "Evangelical Covenant"
   90       "Holiness Church of God"
   89       "Grace Reformed"
   88       "Disciples of God"
   87       "Zion Union Apostolic--Reformed"
   86       "Zion Union Apostolic"
   85       "Zion Union"
   84       "Wesleyan Methodist--Pilgrim"
   83       "Wesleyan"
   82       "United Church, Unity Church"
   81       "United Church of Christ"
   80       "Unitarian, Universalist"
   79       "United Holiness"
   78       "Sanctified, Sanctification"
   77       "7th Day Adventist"
   76       "Salvation Army"
   75       "Mind Science"
   74       "Religious Science"
   73       "Reformed Church of Christ"
   72       "Reformed United Church of Christ"
   71       "Reformed"
   70       "Quaker"
   69       "Pentecostal Holiness, Holiness Pentecostal"
   68       "Pentecostal"
   67       "Pentecostal Church of God"
   66       "Pentecostal Assembly of God"
   65       "Nazarene"
   64       "Mormon"
   63       "Mennonite"
   62       "LDS--Jesus Christ; Church of Jesus LDS"
   61       "LDS--Reorganized"
   60       "LDS--Mormon"
   59       "LDS"
   58       "Jehovah's Witnesses"
   57       "Pilgrim Holiness"
   56       "Holiness; Church of Holiness"
   55       "Holy Roller"
   54       "Friends"
   53       "Four Square Gospel"
   52       "Full Gospel"
   51       "First Christian"
   50       "First Reformed"
   49       "First Christian Disciples of Christ"
   48       "First Church"
   47       "Evangelist Free Church"
   46       "Evangelical Reformed"
   45       "Evangelical, Evangelist"
   44       "Disciples of Christ"
   43       "Dutch Reform"
   42       "Covenant"
   41       "Community Church"
   40       "Congregationalist, 1st Congreg"
   39       "Church of the Living God"
   38       "Church of God in Christ Holiness"
   37       "Church of God in Christ"
   36       "Churches of God(Except with Christ and Holiness)"
   35       "Church of Christ"
   34       "Church of Christ, Evangelical"
   33       "Christian Scientist "
   32       "Christian Reform"
   31       "Christian; Central Christian"
   30       "Christ Adelphians"
   29       "Christ Church Unity "
   28       "Christian Catholic"
   27       "Open Bible"
   26       "Christ in Christian Union "
   25       "Christian Disciples "
   24       "Independent"
   23       "United Brethren, United Brethren in Christ"
   22       "Brethren, Plymouth"
   21       "Witness Holiness"
   20       "Brethren Church, Brethren "
   19       "Baptist (Northern)"
   18       "Holiness (Nazarene) "
   17       "Eden Evangelist"
   16       "Free Will Baptist"
   15       "African Methodist"
   14       "Apostolic Faith"
   13       "Free Methodist"
   12       "Assembly of God"
   11       "Spiritualist"
   10       "Advent Christian"
   9        "Christian & Missionary Alliance"
   8        "Moravian"
   7        "Church of God, Saint & Christ"
   6        "New Testament Christian"
   5        "Church of Prophecy"
   3        "Ind Bible, Bible, Bible Fellowship"
   2        "Evangelical Congregational"
   1        "Hungarian Reformed"
   0        "Not applicable"
;
label define gsp047x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp048x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp049x
   9        "No answer"
   8        "Don't know"
   2        "Not allowed"
   1        "Allowed"
   0        "Not applicable"
;
label define gsp050x
   9        "No answer"
   8        "Don't know"
   2        "Not allowed"
   1        "Allowed"
   0        "Not applicable"
;
label define gsp051x
   9        "No answer"
   8        "Don't know"
   2        "On right track"
   1        "Too much care"
   0        "Not applicable"
;
label define gsp052x
   9        "No answer"
   8        "No opinion"
   4        "Strngly disagree"
   3        "Somewht disagree"
   2        "Somewhat agree"
   1        "Strongly agree"
   0        "Not applicable"
;
label define gsp053x
   9        "No answer"
   8        "Don't know"
   3        "Too much"
   2        "About right"
   1        "Too little"
   0        "Not applicable"
;
label define gsp054x
   9        "No answer"
   8        "Don't know"
   7        "Other party"
   6        "Strong republican"
   5        "Not str republican"
   4        "Ind,near rep"
   3        "Independent"
   2        "Ind,near dem"
   1        "Not str democrat"
   0        "Strong democrat"
;
label define gsp055x
   99       "No answer"
   98       "Don't know"
   13       "Refused"
   12       "$25000 or more"
   11       "$20000 - 24999"
   10       "$15000 - 19999"
   9        "$10000 - 14999"
   8        "$8000 to 9999"
   7        "$7000 to 7999"
   6        "$6000 to 6999"
   5        "$5000 to 5999"
   4        "$4000 to 4999"
   3        "$3000 to 3999"
   2        "$1000 to 2999"
   1        "Lt $1000"
   0        "Not applicable"
;
label define gsp056x
   99       "No answer"
   98       "Don't know"
   13       "Refused"
   12       "$25000 or more"
   11       "$20000 - 24999"
   10       "$15000 - 19999"
   9        "$10000 - 14999"
   8        "$8000 to 9999"
   7        "$7000 to 7999"
   6        "$6000 to 6999"
   5        "$5000 to 5999"
   4        "$4000 to 4999"
   3        "$3000 to 3999"
   2        "$1000 to 2999"
   1        "Lt $1000"
   0        "Not applicable"
;
label define gsp057x
   9        "No answer"
   8        "8 or more"
;


label values ballot   gsp001x;
label values bible    gsp002x;
label values prayer   gsp003x;
label values spden16  gsp004x;
label values sprel16  gsp005x;
label values spfund   gsp006x;
label values sprel    gsp007x;
label values fund16   gsp008x;
label values denom16  gsp009x;
label values relig16  gsp010x;
label values neargod  gsp011x;
label values pray     gsp012x;
label values postlife gsp013x;
label values health   gsp014x;
label values xmovie   gsp015x;
label values partners gsp016x;
label values sexornt  gsp017x;
label values evstray  gsp018x;
label values sexsex5  gsp019x;
label values partnrs5 gsp020x;
label values nummen   gsp021x;
label values numwomen gsp022x;
label values sexfreq  gsp023x;
label values paidsex  gsp024x;
label values pikupsex gsp025x;
label values acqntsex gsp026x;
label values frndsex  gsp027x;
label values matesex  gsp028x;
label values reliten  gsp029x;
label values attend   gsp030x;
label values fund     gsp031x;
label values sex      gsp032x;
label values degree   gsp033x;
label values educ     gsp034x;
label values age      gsp035x;
label values childs   gsp036x;
label values sibs     gsp037x;
label values spwrksta gsp038x;
label values divorce  gsp039x;
label values martype  gsp040x;
label values marital  gsp041x;
label values wrkstat  gsp042x;
label values race     gsp043x;
label values reg16    gsp044x;
label values hompop   gsp045x;
label values other    gsp046x;
label values denom    gsp047x;
label values relig    gsp048x;
label values spkhomo  gsp049x;
label values spkath   gsp050x;
label values govcare  gsp051x;
label values equal1   gsp052x;
label values natfarez gsp053x;
label values partyid  gsp054x;
label values rincome  gsp055x;
label values income   gsp056x;
label values babies   gsp057x;


