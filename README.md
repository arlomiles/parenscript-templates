# parenscript-templates
A modern templating engine for parenscript

## How to use
At the beginning of your file:
```
(load "parenscript-templates.lisp")
(use-package :parenscript-templates)
```
An example:
```
(html (a :href "//example.com" "Click here, or click one of the images!" (div (img :src "//images.example.com/1.png") (img :src "//images.example.com/2.png"))))
=> <!DOCTYPE html><html ><a href="//example.com" >Click here, or click one of the images! <div ><img src="//images.example.com/1.png" ></img> <img src="//images.example.com/2.png" ></img> </div> </a></html>
```
## TODO
* ASDF support