(: extract_dominant_set ($ root $ node_value))
(: dominant_set [])
(: _append_guard_set ($ current $ active))
(if (== ($ current_value $ node_value)) {
    (return $ current)
})
(if (and $ active (guardSet $ current)) {
    (: guardSetValue (map (lambda $ node (node_value $ node))))
    (guardSet $ current)
    (append $ dominant_set $ guardSetValue)
    (: active false)
})
(: active (== ($ current_value "AND")))
(lambda ($ children))
(if (empty $ children)) {
    (return none)
}
(: child (first $ children))
(: result (_append_guard_set $ child $ active))
(if ($ result) {
    (return $ result)
} {
    (recur (rest $ children))
})
(_append_guard_set $ root false)
(return (tuple none $ dominant_set))







