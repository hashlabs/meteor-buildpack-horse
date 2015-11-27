#!/bin/sh
# Add an alias of MAILGUN_URL to MAIL_URL
echo "-----> Adding MAILGUN_URL -> MAIL_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mailgun.sh <<EOF
  #!/bin/sh
  # Set MAIL_URL to MAILGUN_URL if it's not already set
  MAIL_LOGIN=`echo $MAILGUN_SMTP_LOGIN | sed -e "s/\@/%40/g"`

  if [ \$MAIL_LOGIN ] ; then
    export MAIL_URL="smtp://\$MAIL_LOGIN:\$MAILGUN_SMTP_PASSWORD@\$MAILGUN_SMTP_SERVER:\$MAILGUN_SMTP_PORT";
  fi
EOF
