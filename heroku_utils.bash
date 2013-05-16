function hconsole {
  if [ -z $1 ] ;
  then echo 'Usage:  hconsole <environment_name>' && return 1 ;
  fi
  CMD="hr console $1"
  echo $CMD
  $CMD
}
function hr {
  USAGE='Usage:  hr console|bash <environment_name>'
	# TODO:  Need to handle "heroku run rake db:migrate staging"
  #USAGE='Usage:  hr console|bash|rake [command] <environment_name>'
  if [ -z $1 ] ;
  then echo $USAGE && return 1 ;
  fi

  if [ -z $2 ] ;
  then echo $USAGE && return 1 ;
  fi

  if [ -z $3 ] ;
	then CMD="h run $1 $2" ;
	else CMD="h run $1 $2 $3" ;
  fi

  echo $CMD
  $CMD
}
function h {
  USAGE='Usage:  h (run console|bash|(rake <command>))|ps|<other_commands> <environment_name>'
  #USAGE='Usage:  h (r[un] c[onsole]|b[ash]|(r[ake] <command>))|p[s]|<other_commands> <environment_name>'

  if [ -z $1 ] ;
  then echo $USAGE && return 1 ;
	elif [ -z $2 ] ;
  then echo $USAGE && return 1 ;
	fi

	EXECUTABLE=heroku

  if [ -z $6 ] ;
	then CMD="$EXECUTABLE $1 $2 $3 $4 --app unow-$5" ;
	fi

  if [ -z $5 ] ;
	then CMD="$EXECUTABLE $1 $2 $3 --app unow-$4" ;
	fi

  if [ -z $4 ] ;
	then CMD="he $1 $2 --app unow-$3" ;
	fi

  if [ -z $3 ] ;
	then CMD="$EXECUTABLE $1 --app unow-$2" ;
	fi

  echo $CMD
  $CMD
}
function he {
	CMD="heroku $*"
	echo $CMD
	$CMD
}
