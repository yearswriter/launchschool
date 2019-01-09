@u=15
@telegram_message={
                        update_id:        "update_id",
                        id:               "id",
                        telegram_message: "text",
                        date:             "date",
                        chat_id:          "chat_id",
                        chat_username:    "chat_username",
                        from_id:          "from_id",
                        from_last_name:   "from_last_name",
                        from_first_name:  "from_first_name",
                        from_username:    "from_username"
}
@timestamp="date"


@h= <<~EOF;
    \<div class="microposts onload row" id="messages"  title="Новые сообщения" class="new_messages">
    \<div id="micropost-#{@telegram_message[:id]}>" class="col-sm-3">
      \<div class="user" title="@#{@telegram_message[:from_username]}">
        #{@telegram_message[:from_first_name]} #{@telegram_message[:from_last_name]}
      <\/div>
      \<div class="content" title="#{@telegram_message[:chat_username]}">
        #{@telegram_message[:telegram_message]}
      \</div>
      \<div class="timestamp">
        #{@timestamp}
      \</div>
    \</div>
    \</div>
EOF

puts @h
=begin
         

=end