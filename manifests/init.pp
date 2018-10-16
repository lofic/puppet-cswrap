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

    include corosync

    cs_shadow { 'puppet': }

    $primitives.each   |$k, $v| { cs_primitive    { $k: * => $v } }

    $locations.each    |$k, $v| { cs_location     { $k: * => $v } }

    $colocations.each  |$k, $v| { cs_colocation   { $k: * => $v } }

    $orders.each       |$k, $v| { cs_order        { $k: * => $v } }

    $clones.each       |$k, $v| { cs_clone        { $k: * => $v } }

    $properties.each   |$k, $v| { cs_property     { $k: * => $v } }

    $rsc_defaults.each |$k, $v| { cs_rsc_defaults { $k: * => $v } }

    cs_commit { 'puppet': }

}
