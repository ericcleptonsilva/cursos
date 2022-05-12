# RoadMap Flutter

```plantuml

@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

Person(Aluno, "Aluno", "Aprendendo A programar com Flutter")
Container(RoadMap, "Road Map","", " O objetivo desse repositório é catalogar os conteúdos existentes na internet sobre Flutter e concatenar em uma espécie de 'roadmap' para auxiliar os iniciantes.",)

Container(EscreverCodigos,  "Escrever Códigos","")
Container(VideoAbout,  "O MÍNIMO QUE VOCÊ PRECISA SABER ANTES DE PROGRAMAR!",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=BTENKdRVS2U")

Container(LogicaDeProgramacao, "Lógica de Programação","", $sprite="img:https://cdn-icons-png.flaticon.com/512/5090/5090023.png{scale=0.1}","Precisamos entender como criar algorítmos, por tanto, antes de realmente colocar a mão no código, é importante estudar um pouco sobre Lógica de programação.")

Container(CursoLogicaProgramacao, "Curso de lógica de programação.",   $sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}", $link="https://www.youtube.com/watch?v=8mei6uVttho&list=PLHz_AreHm4dmSj0MHol_aoNYCSGFqvfXV",)

Container(CursoLogicaProgramacao21, "Curso Lógica de Programação Completo 2021",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=iF2MdbrTiBM")

Container(CursoLogicaProgramacao, "Curso de lógica de programação.",   $sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}" , $link="https://www.youtube.com/watch?v=8mei6uVttho&list=PLHz_AreHm4dmSj0MHol_aoNYCSGFqvfXV",)

Container(POO, "Orientação a Objetos (POO)", "","Esse é o paradgma mais utilizado no Flutter. Por isso devemos conhecer o básico para iniciar nesse framework. Não tenha medo de aprender 2 ou 3 linguagens a mais para dominar esse paradgma. É recomendado aprender um pouco sobre o Java, pois é uma linguagem que utiliza exclusivamente a POO, forçando-o a entender toda a base desse paradgma.",)

Container(CursoPOO, "Programação Orientada a Objetos (POO)",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=QY0Kdg83orY")

Container(Curso2POO, "Curso de programação oriendada a objetos",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=KlIL63MeyMY&list=PLHz_AreHm4dkqe2aR0tQK74m8SFe-aGsY")

Container(Dart, "O Dart","","Após entender mais sobre Lógica de Programação, devemos focar na linguagem principal do Flutter, o Dart.",$sprite="img:https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png{scale=0.09}")

Container(CursoAbout, "Dart (a linguagem do Flutter)",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=i7IzlVImHEc")

Container(CursoAbout2, "Por que o Flutter usa o Dart (Ative as legendas)",$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=5F-6n_2XWR8")

Container(CursosGratuitos, "CURSOS GRATUITOS:",,$sprite="img:https://cdn-icons-png.flaticon.com/512/408/408706.png{scale=0.1}",$link="https://www.youtube.com/watch?v=PgRv_aeqf-4&list=PLRpTFz5_57cseSiszvssXO7HKVzOsrI77")

Container(CursosPagos, "CURSOS PAGOS:",,$sprite="img:https://s3.sa-east-1.amazonaws.com/static.launchlab.com.br/2d5fb720-9323-48f8-872d-548e39749fe9.png{scale=0.1}",$link="https://masterclass.flutterando.com.br/public/products/e141c9c5-0b60-4e0e-96f1-e31d433e2a09")

Container(CursosDart, "Cursos Dart",$sprite="img:https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png{scale=0.09}",$link="")
Container(Doc, "DOCUMENTAÇÃO:",$sprite="img:https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png{scale=0.09}",$link="https://dart.dev/guides/language/language-tour")


Rel(Aluno, RoadMap,)
Rel(RoadMap, EscreverCodigos, 'Start')
Rel(EscreverCodigos, VideoAbout, "É recomendado assistir ESTE VÍDEO  antes de iniciar")
Rel(VideoAbout,LogicaDeProgramacao,"Nessa etapa não é necessário saber nenhuma linguagem." )
Rel_L(LogicaDeProgramacao,CursoLogicaProgramacao,"Curso" )
Rel_R(LogicaDeProgramacao,CursoLogicaProgramacao21,"Curso")
Rel(LogicaDeProgramacao,POO,)
Rel_L(POO,CursoPOO,"Curso")
Rel_R(POO,Curso2POO,"Curso")
Rel(POO,Dart,"O Dart")
Rel_L(Dart,CursoAbout,"about")
Rel_R(Dart,CursoAbout2,"about")
Rel(Dart,CursosDart,"Doc")
Rel_R(CursosDart,CursosGratuitos,"Cursos")
Rel_L(CursosDart,CursosPagos,"Cursos")
Rel(CursosDart,Doc,"Não pule essa etapa, pois conhecer a base do Dart será o principal diferencial para desenvolver em Flutter.")


@enduml
```
