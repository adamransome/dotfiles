;;; functions.el

(defun mini-uuid ()
  "Returns an 8 character segment of a UUID."
  (interactive)
  (message (shell-command-to-string "uuidgen | awk -F'-' '{print $1}'")))
