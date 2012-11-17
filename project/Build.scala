import sbt._
import Keys._
import PlayProject._

object ApplicationBuild extends Build {

    val appName         = "todolist2"

    val appVersion      = "1.0"

    val appDependencies = Seq(
      "postgresql" % "postgresql" % "8.4-702.jdbc4",
      "org.webjars" % "bootstrap" % "2.1.1",
      "org.mindrot" % "jbcrypt" % "0.3m",
      "jp.t2v" % "play20.auth_2.9.1" % "0.4-SNAPSHOT",
      "commons-daemon" % "commons-daemon" % "1.0.10"
    )

    lazy val main = PlayProject(appName, appVersion, appDependencies, mainLang = SCALA).settings(
      resolvers += "jbcrypt repo" at "http://mvnrepository.com/",
      resolvers += "t2v.jp repo" at "http://www.t2v.jp/maven-repo/"
    )

}
