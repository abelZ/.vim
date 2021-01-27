;RAlt::AppsKey ; right-Option to context menu
;RWin::Del ; right command to forward delete
;LWin::LAlt ; left command to alt
;LAlt::LWin ; left alt to command (windows key)
RAlt::RCtrl
RWin::RAlt

SetTitleMatchMode RegEx
#IfWinActive ahk_exe xy2_tab.exe
LWin & Tab::AltTab
LWin & q::^Tab

;#q::Send !q
#w::Send !w
#e::Send !e
#r::Send !q
#t::Send !t
#a::Send !a
#s::Send !s
#d::Send !d
#f::Send !f
#g::Send !g
#z::Send !z
#x::Send !x
#c::Send !c
#v::Send !r
#b::Send !b
#1::Send !1
#2::Send !2
#3::Send !3
#4::Send !4
#5::Send !5
#6::Send !6

LWin::return

#IfWinActive

