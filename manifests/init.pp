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

    # Defaults
    $d = { cib => 'puppet' }

    cs_shadow { 'puppet': }

    $primitives.each   |$k, $v| { cs_primitive    { $k: * => $d + $v } }

    $locations.each    |$k, $v| { cs_location     { $k: * => $d + $v } }

    $colocations.each  |$k, $v| { cs_colocation   { $k: * => $d + $v } }

    $orders.each       |$k, $v| { cs_order        { $k: * => $d + $v } }

    $clones.each       |$k, $v| { cs_clone        { $k: * => $d + $v } }

    $properties.each   |$k, $v| { cs_property     { $k: * => $d + $v } }

    $rsc_defaults.each |$k, $v| { cs_rsc_defaults { $k: * => $d + $v } }

    cs_commit { 'puppet': }

}
