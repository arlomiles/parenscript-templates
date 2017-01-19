; TODO use ASDF

(defpackage :parenscript-templates
	(:export
		:a
		:abbr
		:address-t
		:area
		:article
		:aside
		:audio
		:b
		:base
		:bdi
		:bdo
		:blockquote
		:body
		:br
		:button
		:canvas
		:caption
		:cite
		:code
		:col
		:colgroup
		:datalist
		:dd
		:del
		:details
		:dfn
		:dialog
		:div
		:dl
		:dt
		:em
		:embed
		:fieldset
		:figcaption
		:figure
		:footer
		:form
		:h1
		:h2
		:h3
		:h4
		:h5
		:h6
		:head
		:header
		:hr
		:i
		:iframe
		:img
		:input
		:ins
		:kbd
		:keygen
		:label
		:legend
		:li
		:link
		:main
		:map-t
		:mark
		:menu
		:menuitem
		:meta
		:meter
		:nav
		:noscript
		:object-t
		:ol
		:otpgroup
		:option
		:output
		:p
		:param
		:picture
		:pre
		:progress
		:q
		:rp
		:rt
		:ruby
		:s
		:samp
		:script
		:section
		:select
		:small
		:source
		:span
		:strong
		:style
		:sub
		:summary
		:sup
		:table
		:tbody
		:td
		:textarea
		:tfoot
		:th
		:thead
		:time-t
		:title
		:tr
		:track
		:u
		:ul
		:var
		:video
		:wbr
		:comment
		:html
	)
)

(in-package :parenscript-templates)

(defmacro make-standard-tag (tag)
	`(defun ,tag (&rest args)
		(apply #'make-element (cons ,(string-downcase (string tag)) args))
	)
)
(defun attrib-list (&rest args) (cond
	((and (keywordp (car args)) (stringp (cadr args))) (concatenate 'string (string-downcase (string (car args))) "=" "\"" (cadr args) "\"" " " (apply #'attrib-list (cddr args))))
	(t "")	
))
(defun inner-html (&rest args) (cond
	((and (null (car args)) (null (cadr args))) "")
	((and (stringp (car args)) (null (cadr args))) (car args))
	((and (stringp (car args)) (stringp (cadr args))) (concatenate 'string (car args) " " (cadr args) " " (apply #'inner-html (cddr args))))
	(t (apply #'inner-html (cddr args)))
))
(defun elst (&rest args) (apply #'concatenate (cons 'string args)))
(defun make-element (type &rest args) (concatenate 'string "<" type " " (apply #'attrib-list args) ">" (apply #'inner-html args) "</" type ">"))
(make-standard-tag a)
(make-standard-tag abbr)
(make-standard-tag address-t)
(make-standard-tag area)
(make-standard-tag article)
(make-standard-tag aside)
(make-standard-tag audio)
(make-standard-tag b)
(make-standard-tag base)
(make-standard-tag bdi)
(make-standard-tag bdo)
(make-standard-tag blockquote)
(make-standard-tag body)
(make-standard-tag br)
(make-standard-tag button)
(make-standard-tag canvas)
(make-standard-tag caption)
(make-standard-tag cite)
(make-standard-tag code)
(make-standard-tag col)
(make-standard-tag colgroup)
(make-standard-tag datalist)
(make-standard-tag dd)
(make-standard-tag del)
(make-standard-tag details)
(make-standard-tag dfn)
(make-standard-tag dialog)
(make-standard-tag div)
(make-standard-tag dl)
(make-standard-tag dt)
(make-standard-tag em)
(make-standard-tag embed)
(make-standard-tag fieldset)
(make-standard-tag figcaption)
(make-standard-tag figure)
(make-standard-tag footer)
(make-standard-tag form)
(make-standard-tag h1)
(make-standard-tag h2)
(make-standard-tag h3)
(make-standard-tag h4)
(make-standard-tag h5)
(make-standard-tag h6)
(make-standard-tag head)
(make-standard-tag header)
(make-standard-tag hr)
(make-standard-tag i)
(make-standard-tag iframe)
(make-standard-tag img)
(make-standard-tag input)
(make-standard-tag ins)
(make-standard-tag kbd)
(make-standard-tag keygen)
(make-standard-tag label)
(make-standard-tag legend)
(make-standard-tag li)
(make-standard-tag link)
(make-standard-tag main)
(make-standard-tag map-t)
(make-standard-tag mark)
(make-standard-tag menu)
(make-standard-tag menuitem)
(make-standard-tag meta)
(make-standard-tag meter)
(make-standard-tag nav)
(make-standard-tag noscript)
(make-standard-tag object-t)
(make-standard-tag ol)
(make-standard-tag otpgroup)
(make-standard-tag option)
(make-standard-tag output)
(make-standard-tag p)
(make-standard-tag param)
(make-standard-tag picture)
(make-standard-tag pre)
(make-standard-tag progress)
(make-standard-tag q)
(make-standard-tag rp)
(make-standard-tag rt)
(make-standard-tag ruby)
(make-standard-tag s)
(make-standard-tag samp)
(make-standard-tag script)
(make-standard-tag section)
(make-standard-tag select)
(make-standard-tag small)
(make-standard-tag source)
(make-standard-tag span)
(make-standard-tag strong)
(make-standard-tag style)
(make-standard-tag sub)
(make-standard-tag summary)
(make-standard-tag sup)
(make-standard-tag table)
(make-standard-tag tbody)
(make-standard-tag td)
(make-standard-tag textarea)
(make-standard-tag tfoot)
(make-standard-tag th)
(make-standard-tag thead)
(make-standard-tag time-t)
(make-standard-tag title)
(make-standard-tag tr)
(make-standard-tag track)
(make-standard-tag u)
(make-standard-tag ul)
(make-standard-tag var)
(make-standard-tag video)
(make-standard-tag wbr)
(defun comment (&rest args) (concatenate 'string "<!-- " (apply #'concatenate (cons 'string args)) " -->"))
(defun html (&rest args) (concatenate 'string "<!DOCTYPE html>" (apply #'make-element (cons "html" args))))
