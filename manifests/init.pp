# Wrapper for the puppet/corosync module

class cswrap(
    $primitives = {},
    $locations = {},
    $colocations = {},
    $orders = {},
    $clones = {},
    $properties = {},
    $rsc_defaults = {},


) {

    cs_shadow { 'puppet': }

    $primitives.each |$k, $v| { cs_primitive { $k: * => $v } }

    cs_commit { 'puppet': }

}
