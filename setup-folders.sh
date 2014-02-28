source bash_functions

SITE_ROOT=`getsetting site_root`
if [ "$SITE_ROOT" ]
  then
    ln -s "$SITE_ROOT" ~/active/site-root
  fi

THEME=`getsetting theme`
if [ "$THEME" ]
  then
    ln -s "$THEME" ~/active/theme
  fi

GDOCS=`getsetting gdocs`
if [ "$GDOCS" ]
  then
    ln -s "$GDOCS" ~/active/docs
  fi
