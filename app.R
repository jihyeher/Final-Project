setwd("/Applications/2021-1/대용량자료관리및시각화/데이터 분석 프로젝트/shiny")

library(shiny)
library(ggmap)
library(shinythemes)

travel_seoul=c("롯데월드","국립중앙박물관","서울시립미술관 본관")
seoul_df=data.frame(travel_seoul,stringsAsFactors = FALSE)
seoul_df$travel_seoul=enc2utf8(seoul_df$travel_seoul)
seoul_latlon=mutate_geocode(seoul_df,travel_seoul)

travel_busan=c("감천문화마을","누리마루 APEC하우스","송도구름산책로")
busan_df=data.frame(travel_busan,stringsAsFactors = FALSE)
busan_df$travel_busan=enc2utf8(busan_df$travel_busan)
busan_latlon=mutate_geocode(busan_df,travel_busan)

travel_gyeonggi_nature=c("두물머리","마장호수","포천 한탄강 하늘다리")
gyeonggi_nature_df=data.frame(travel_gyeonggi_nature,stringsAsFactors = FALSE)
gyeonggi_nature_df$travel_gyeonggi_nature=enc2utf8(gyeonggi_nature_df$travel_gyeonggi_nature)
gyeonggi_nature_latlon=mutate_geocode(gyeonggi_nature_df,travel_gyeonggi_nature)

travel_gyeonggi_rest=c("유명산자연휴양림","용인 자연휴양림","바라산자연휴양림")
gyeonggi_rest_df=data.frame(travel_gyeonggi_rest,stringsAsFactors = FALSE)
gyeonggi_rest_df$travel_gyeonggi_rest=enc2utf8(gyeonggi_rest_df$travel_gyeonggi_rest)
gyeonggi_rest_latlon=mutate_geocode(gyeonggi_rest_df,travel_gyeonggi_rest)

travel_gangwon_nature=c("정동심곡바다부채길","용평리조트(발왕산전망대 곤돌라)","무릉계곡")
gangwon_nature_df=data.frame(travel_gangwon_nature,stringsAsFactors = FALSE)
gangwon_nature_df$travel_gangwon_nature=enc2utf8(gangwon_nature_df$travel_gangwon_nature)
gangwon_nature_latlon=mutate_geocode(gangwon_nature_df,travel_gangwon_nature)

travel_gangwon_rest=c("백운산자연휴양림","가리왕산자연휴양림","대관령자연휴양림")
gangwon_rest_df=data.frame(travel_gangwon_rest,stringsAsFactors = FALSE)
gangwon_rest_df$travel_gangwon_rest=enc2utf8(gangwon_rest_df$travel_gangwon_rest)
gangwon_rest_latlon=mutate_geocode(gangwon_rest_df,travel_gangwon_rest)

travel_gyeongnam_nature=c("바람의 언덕","해금강,외도","진해내수면환경생태공원")
gyeongnam_nature_df=data.frame(travel_gyeongnam_nature,stringsAsFactors = FALSE)
gyeongnam_nature_df$travel_gyeongnam_nature=enc2utf8(gyeongnam_nature_df$travel_gyeongnam_nature)
gyeongnam_nature_latlon=mutate_geocode(gyeongnam_nature_df,travel_gyeongnam_nature)

travel_gyeongnam_rest=c("남해편백자연휴양림","대운산자연휴양림","금원산자연휴양림")
gyeongnam_rest_df=data.frame(travel_gyeongnam_rest,stringsAsFactors = FALSE)
gyeongnam_rest_df$travel_gyeongnam_rest=enc2utf8(gyeongnam_rest_df$travel_gyeongnam_rest)
gyeongnam_rest_latlon=mutate_geocode(gyeongnam_rest_df,travel_gyeongnam_rest)

travel_geonnam_nature=c("오동도","죽녹원","광양시 백운산등산로")
geonnam_nature_df=data.frame(travel_geonnam_nature,stringsAsFactors = FALSE)
geonnam_nature_df$travel_geonnam_nature=enc2utf8(geonnam_nature_df$travel_geonnam_nature)
geonnam_nature_latlon=mutate_geocode(geonnam_nature_df,travel_geonnam_nature)

travel_geonnam_rest=c("제암산 자연휴양림","광양시 백운산 자연휴양림","방장산휴양림")
geonnam_rest_df=data.frame(travel_geonnam_rest,stringsAsFactors = FALSE)
geonnam_rest_df$travel_geonnam_rest=enc2utf8(geonnam_rest_df$travel_geonnam_rest)
geonnam_rest_latlon=mutate_geocode(geonnam_rest_df,travel_geonnam_rest)

travel_gyeongbok_nature=c("갓바위","성류굴","양남 주상절리 전망대")
gyeongbok_nature_df=data.frame(travel_gyeongbok_nature,stringsAsFactors = FALSE)
gyeongbok_nature_df$travel_gyeongbok_nature=enc2utf8(gyeongbok_nature_df$travel_gyeongbok_nature)
gyeongbok_nature_latlon=mutate_geocode(gyeongbok_nature_df,travel_gyeongbok_nature)

travel_gyeongbok_rest=c("성주봉자연휴양림","칠보산자연휴양림","운문산자연휴양림")
gyeongbok_rest_df=data.frame(travel_gyeongbok_rest,stringsAsFactors = FALSE)
gyeongbok_rest_df$travel_gyeongbok_rest=enc2utf8(gyeongbok_rest_df$travel_gyeongbok_rest)
gyeongbok_rest_latlon=mutate_geocode(gyeongbok_rest_df,travel_gyeongbok_rest)

travel_chungnam_nature=c("서산시 팔봉산","광덕산","수암산")
chungnam_nature_df=data.frame(travel_chungnam_nature,stringsAsFactors = FALSE)
chungnam_nature_df$travel_chungnam_nature=enc2utf8(chungnam_nature_df$travel_chungnam_nature)
chungnam_nature_latlon=mutate_geocode(chungnam_nature_df,travel_chungnam_nature)

travel_chungnam_rest=c("안면도자연휴양림","영인산자연휴양림","금산산림문화타운")
chungnam_rest_df=data.frame(travel_chungnam_rest,stringsAsFactors = FALSE)
chungnam_rest_df$travel_chungnam_rest=enc2utf8(chungnam_rest_df$travel_chungnam_rest)
chungnam_rest_latlon=mutate_geocode(chungnam_rest_df,travel_chungnam_rest)


s<-get_googlemap(center=c(lon=127.0399999,lat=37.5535234),zoom=12,maptype = "roadmap")%>%ggmap
b<-get_googlemap("busan",zoom=11,maptype = "roadmap")%>%ggmap
#경기도 지도
g<-get_googlemap(center=c(lon=126.9592003,lat=37.4687936),zoom=9,maptype = "roadmap")%>%ggmap
#강원도 지도
w<-get_googlemap(center=c(lon=127.5921905,lat=37.7943821),zoom=8,maptype = "roadmap")%>%ggmap
#경남 지도
gn<-get_googlemap(center=c(lon=128.5571342,lat=35.176362),zoom=9,maptype = "roadmap")%>%ggmap
#전남 지도
gyn<-get_googlemap(center=c(lon=127.4671342,lat=35.076362),zoom=9,maptype = "roadmap")%>%ggmap
#경북 지도
gb<-get_googlemap(center=c(lon=129.1709119,lat=36.2590268),zoom=8,maptype = "roadmap")%>%ggmap
#충남 지도
cn<-get_googlemap(center=c(lon=126.6355356,lat=36.448361),zoom=9,maptype = "roadmap")%>%ggmap

ui<-fluidPage(theme = shinytheme("superhero"),
  titlePanel(h1("국내여행 추천 방문지")),

  sidebarLayout(
    sidebarPanel(
      p("본인의 연령대와 가고 싶은 지역, 하고 싶은 활동을 고르시면 추천지가 지도에 제시됩니다. "),
      helpText("*단, 20대에서 60대이신 경우에만 사용하실 수 있고 하고 싶은 활동은 서울과 부산의 경우에는 선택하실 수 없습니다. "),
      selectInput("age",h3("연령대"),choices=list("20대"=1,"30대"=2,"40대"=3,"50대"=4,"60대"=5)),
      
      conditionalPanel(condition= "input.age==1",radioButtons("radio1",h3("여행 가고 싶은 지역"),choices=list("서울"=1,"부산"=2,"경기도"=3,"강원도"=4)),conditionalPanel(condition= "input.radio1==3",radioButtons("radio6",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2))),conditionalPanel(condition= "input.radio1==4",radioButtons("radio7",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2)))),
      conditionalPanel(condition= "input.age==2",radioButtons("radio2",h3("여행 가고 싶은 지역"),choices=list("부산"=1,"경기도"=2,"강원도"=3)),conditionalPanel(condition= "input.radio2==2",radioButtons("radio8",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2))),conditionalPanel(condition= "input.radio2==3",radioButtons("radio9",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2)))),
      conditionalPanel(condition= "input.age==3",radioButtons("radio3",h3("여행 가고 싶은 지역"),choices=list("경기도"=1,"강원도"=2, "경남"=3, "전남"=4)),radioButtons("radio10",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2))),
      conditionalPanel(condition= "input.age==4",radioButtons("radio4",h3("여행 가고 싶은 지역"),choices=list("경기도"=1,"강원도"=2,"경남"=3, "전남"=4, "경북"=5)),radioButtons("radio11",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2))),
      conditionalPanel(condition= "input.age==5",radioButtons("radio5",h3("여행 가고 싶은 지역"),choices=list("경기도"=1,"강원도"=2, "경남"=3, "전남"=4, "경북"=5, "충남"=6)),radioButtons("radio12",h3("하고 싶은 활동"),choices=list("자연 및 풍경 감상"=1,"휴식 및 휴양"=2))),
    
      
      img(src= "img.png",height=200,width=200)
    ),
    
    mainPanel(
      plotOutput("map"),
      hr(),
      textOutput("selected_age")
    )
      
  )
)

server<-function(input,output){
  
  radio1Input<-reactive({
    if(input$radio1==1){
      return(s)
    }else if(input$radio1==2){
      return(b)
    }else if(input$radio1==3){
      return(g)
    }else{
      return(w)
    }
  })
  
  radio2Input<-reactive({
    if(input$radio2==1){
      return(b)
    }else if(input$radio2==2){
      return(g)
    }else{
      return(w)
    }
  })
  
  radio3Input<-reactive({
    if(input$radio3==1){
      return(g)
    }else if(input$radio3==2){
      return(w)
    }else if(input$radio3==3){
      return(gn)
    }else{
      return(gyn)
    }
  })
  
  radio4Input<-reactive({
    if(input$radio4==1){
      return(g)
    }else if(input$radio4==2){
      return(w)
    }else if(input$radio4==3){
      return(gn)
    }else if(input$radio4==4){
      return(gyn)
    }else{
      return(gb)
    }
  })
  
  radio5Input<-reactive({
    if(input$radio5==1){
      return(g)
    }else if(input$radio5==2){
      return(w)
    }else if(input$radio5==3){
      return(gn)
    }else if(input$radio5==4){
      return(gyn)
    }else if(input$radio5==5){
      return(gb)
    }else{
      return(cn)
    }
  })
  
  radio6Input<-reactive({
    if(input$radio6==1){
      return(g)
    }else{
      return(g)
    }
  })
  
  radio7Input<-reactive({
    if(input$radio7==1){
      return(w)
    }else{
      return(w)
    }
  })
  
  output$map<-renderPlot({
    if(input$age==1){
      if(input$radio1==1){
        radio1Input()+geom_point(data=seoul_latlon,aes(lon,lat),size=2.5,color="#8b008b")
      }else if(input$radio1==2){
        radio1Input()+geom_point(data=busan_latlon,aes(lon,lat),size=2.5,color="#8b008b")
      }else if(input$radio1==3){
        if(input$radio6==1){
          radio1Input()+geom_point(data=gyeonggi_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio1Input()+geom_point(data=gyeonggi_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else{
        if(input$radio7==1){
          radio1Input()+geom_point(data=gangwon_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio1Input()+geom_point(data=gangwon_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }
    }else if(input$age==2){
      if(input$radio2==1){
        radio2Input()+geom_point(data=busan_latlon,aes(lon,lat),size=2.5,color="#8b008b")
      }else if(input$radio2==2){
        if(input$radio8==1){
          radio2Input()+geom_point(data=gyeonggi_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio2Input()+geom_point(data=gyeonggi_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else{
        if(input$radio9==1){
          radio2Input()+geom_point(data=gangwon_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio2Input()+geom_point(data=gangwon_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }
    }else if(input$age==3){
      if(input$radio3==1){
        if(input$radio10==1){
          radio3Input()+geom_point(data=gyeonggi_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio3Input()+geom_point(data=gyeonggi_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if(input$radio3==2){
        if(input$radio10==1){
          radio3Input()+geom_point(data=gangwon_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio3Input()+geom_point(data=gangwon_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if(input$radio3==3){
        if(input$radio10==1){
          radio3Input()+geom_point(data=gyeongnam_nature_latlon,aes(lon,lat),size=2,color="#8b008b")
        }else{
          radio3Input()+geom_point(data=gyeongnam_rest_latlon,aes(lon,lat),size=2,color="#8b008b")
        }
      }else{
        if(input$radio10==1){
          radio3Input()+geom_point(data=geonnam_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio3Input()+geom_point(data=geonnam_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }
    }else if(input$age==4){
      if(input$radio4==1){
        if(input$radio11==1){
          radio4Input()+geom_point(data=gyeonggi_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio4Input()+geom_point(data=gyeonggi_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if (input$radio4==2){
        if(input$radio11==1){
          radio4Input()+geom_point(data=gangwon_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio4Input()+geom_point(data=gangwon_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if(input$radio4==3){
        if(input$radio11==1){
          radio4Input()+geom_point(data=gyeongnam_nature_latlon,aes(lon,lat),size=2,color="#8b008b")
        }else{
          radio4Input()+geom_point(data=gyeongnam_rest_latlon,aes(lon,lat),size=2,color="#8b008b")
        }
      }else if(input$radio4==4){
        if(input$radio11==1){
          radio4Input()+geom_point(data=geonnam_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio4Input()+geom_point(data=geonnam_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else{
        if(input$radio11==1){
          radio4Input()+geom_point(data=gyeongbok_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio4Input()+geom_point(data=gyeongbok_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }
    }else{
      if(input$radio5==1){
        if(input$radio12==1){
          radio5Input()+geom_point(data=gyeonggi_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=gyeonggi_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if (input$radio5==2){
        if(input$radio12==1){
          radio5Input()+geom_point(data=gangwon_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=gangwon_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if(input$radio5==3){
        if(input$radio12==1){
          radio5Input()+geom_point(data=gyeongnam_nature_latlon,aes(lon,lat),size=2,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=gyeongnam_rest_latlon,aes(lon,lat),size=2,color="#8b008b")
        }
      }else if(input$radio5==4){
        if(input$radio12==1){
          radio5Input()+geom_point(data=geonnam_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=geonnam_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else if(input$radio5==5){
        if(input$radio12==1){
          radio5Input()+geom_point(data=gyeongbok_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=gyeongbok_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }else{
        if(input$radio12==1){
          radio5Input()+geom_point(data=chungnam_nature_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }else{
          radio5Input()+geom_point(data=chungnam_rest_latlon,aes(lon,lat),size=2.5,color="#8b008b")
        }
      }
    }
  })
  
output$selected_age<-renderText({
  if(input$age==1){
    if(input$radio1==1){
      return("서울특별시 송파구 롯데월드, 용산구 국립중앙박물관, 중구 서울시립미술관 본관을 추천합니다.")
    }else if(input$radio1==2){
      return("부산광역시 사하구	감천문화마을, 해운대구	누리마루 APEC하우스, 서구	송도구름산책로를 추천합니다.")
    }else if(input$radio1==3){
      if(input$radio6==1){
        return("경기도 양평군	두물머리, 파주시	마장호수, 포천시	포천 한탄강 하늘다리를 추천합니다.")
      }else{
        return("경기도 가평군	유명산자연휴양림, 용인시	용인 자연휴양림, 의왕시	바라산자연휴양림을 추천합니다.")
      }
    }else{
      if(input$radio7==1){
        return("강원도 강릉시	정동심곡바다부채길, 평창군	용평리조트(발왕산전망대 곤돌라), 동해시	무릉계곡을 추천합니다.")
      }else{
        return("강원도 원주시	백운산자연휴양림, 정선군	가리왕산자연휴양림, 강릉시	대관령자연휴양림를 추천합니다.")
      }
    }
  }else if(input$age==2){
    if(input$radio2==1){
      return("부산광역시 사하구	감천문화마을, 해운대구	누리마루 APEC하우스, 서구	송도구름산책로를 추천합니다.")
    }else if(input$radio2==2){
      if(input$radio8==1){
        return("경기도 양평군	두물머리, 파주시	마장호수, 포천시	포천 한탄강 하늘다리를 추천합니다.")
      }else{
        return("경기도 가평군	유명산자연휴양림, 용인시	용인 자연휴양림, 의왕시	바라산자연휴양림을 추천합니다.")
      }
    }else{
      if(input$radio9==1){
        return("강원도 강릉시	정동심곡바다부채길, 평창군	용평리조트(발왕산전망대 곤돌라), 동해시	무릉계곡을 추천합니다.")
      }else{
        return("강원도 원주시	백운산자연휴양림, 정선군	가리왕산자연휴양림, 강릉시	대관령자연휴양림를 추천합니다.")
      }
    }
  }else if(input$age==3){
    if(input$radio3==1){
      if(input$radio10==1){
        return("경기도 양평군	두물머리, 파주시	마장호수, 포천시	포천 한탄강 하늘다리를 추천합니다.")
      }else{
        return("경기도 가평군	유명산자연휴양림, 용인시	용인 자연휴양림, 의왕시	바라산자연휴양림을 추천합니다.")
      }
    }else if(input$radio3==2){
      if(input$radio10==1){
        return("강원도 강릉시	정동심곡바다부채길, 평창군	용평리조트(발왕산전망대 곤돌라), 동해시	무릉계곡을 추천합니다.")
      }else{
        return("강원도 원주시	백운산자연휴양림, 정선군	가리왕산자연휴양림, 강릉시	대관령자연휴양림를 추천합니다.")
      }
    }else if(input$radio3==3){
      if(input$radio10==1){
        return("경상남도 거제시	바람의 언덕, 거제시	해금강,외도, 통합창원시	진해내수면환경생태공원을 추천합니다.")
      }else{
        return("경상남도 	남해군 남해편백자연휴양림, 양산시 대운산자연휴양림, 거창군 금원산자연휴양림을 추천합니다.")
      }
    }else{
      if(input$radio10==1){
        return("전라남도 여수시 오동도, 담양군 죽녹원, 광양시 백운산등산로를 추천합니다.")
      }else{
        return("전라남도 보성군	제암산 자연휴양림, 	광양시 백운산 자연휴양림, 장성군 방장산휴양림을 추천합니다.")
      }
    }
  }else if(input$age==4){
    if(input$radio4==1){
      if(input$radio11==1){
        return("경기도 양평군	두물머리, 파주시	마장호수, 포천시	포천 한탄강 하늘다리를 추천합니다.")
      }else{
        return("경기도 가평군	유명산자연휴양림, 용인시	용인 자연휴양림, 의왕시	바라산자연휴양림을 추천합니다.")
      }
    }else if(input$radio4==2){
      if(input$radio11==1){
        return("강원도 강릉시	정동심곡바다부채길, 평창군	용평리조트(발왕산전망대 곤돌라), 동해시	무릉계곡을 추천합니다.")
      }else{
        return("강원도 원주시	백운산자연휴양림, 정선군	가리왕산자연휴양림, 강릉시	대관령자연휴양림를 추천합니다.")
      }
    }else if(input$radio4==3){
      if(input$radio11==1){
        return("경상남도 거제시	바람의 언덕, 거제시	해금강,외도, 통합창원시	진해내수면환경생태공원을 추천합니다.")
      }else{
        return("경상남도 	남해군 남해편백자연휴양림, 양산시 대운산자연휴양림, 거창군 금원산자연휴양림을 추천합니다.")
      }
    }else if(input$radio4==4){
      if(input$radio11==1){
        return("전라남도 여수시 오동도, 담양군 죽녹원, 광양시 백운산등산로를 추천합니다.")
      }else{
        return("전라남도 보성군	제암산 자연휴양림, 	광양시 백운산 자연휴양림, 장성군 방장산휴양림을 추천합니다.")
      }
    }else{
      if(input$radio11==1){
        return("경상북도 경산시 갓바위, 울진군 성류굴, 경주시 양남 주상절리 전망대를 추천합니다.")
      }else{
        return("경상북도 상주시 성주봉자연휴양림, 영덕군 칠보산자연휴양림과 청도군 운문산자연휴양림을 추천합니다.")
      }
    }
  }else{
    if(input$radio5==1){
      if(input$radio12==1){
        return("경기도 양평군	두물머리, 파주시	마장호수, 포천시	포천 한탄강 하늘다리를 추천합니다.")
      }else{
        return("경기도 가평군	유명산자연휴양림, 용인시	용인 자연휴양림, 의왕시	바라산자연휴양림을 추천합니다.")
      }
    }else if(input$radio5==2){
      if(input$radio12==1){
        return("강원도 강릉시	정동심곡바다부채길, 평창군	용평리조트(발왕산전망대 곤돌라), 동해시	무릉계곡을 추천합니다.")
      }else{
        return("강원도 원주시	백운산자연휴양림, 정선군	가리왕산자연휴양림, 강릉시	대관령자연휴양림를 추천합니다.")
      }
    }else if(input$radio5==3){
      if(input$radio12==1){
        return("경상남도 거제시	바람의 언덕, 거제시	해금강,외도, 통합창원시	진해내수면환경생태공원을 추천합니다.")
      }else{
        return("경상남도 	남해군 남해편백자연휴양림, 양산시 대운산자연휴양림, 거창군 금원산자연휴양림을 추천합니다.")
      }
    }else if(input$radio5==4){
      if(input$radio12==1){
        return("전라남도 여수시 오동도, 담양군 죽녹원, 광양시 백운산등산로를 추천합니다.")
      }else{
        return("전라남도 보성군	제암산 자연휴양림, 	광양시 백운산 자연휴양림, 장성군 방장산휴양림을 추천합니다.")
      }
    }else if(input$radio5==5){
      if(input$radio12==1){
        return("경상북도 경산시 갓바위, 울진군 성류굴, 경주시 양남 주상절리 전망대를 추천합니다.")
      }else{
        return("경상북도 상주시 성주봉자연휴양림, 영덕군 칠보산자연휴양림과 청도군 운문산자연휴양림을 추천합니다.")
      }
    }else{
      if(input$radio12==1){
        return("충청남도 서산시 팔봉산, 천안시 광덕산, 예산군 수암산를 추천합니다.")
      }else{
        return("충청남도 태안군 안면도자연휴양림, 아산시 영인산자연휴양림과 금산군 금산산림문화타운을 추천합니다.")
      }
    }    
  }
})

}


shinyApp(ui,server)

