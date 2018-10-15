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

    $primitives.each |$k, $v| { cs_primitive { $k: * => $v } }

    $properties.each |$k, $v| { cs_property  { $k: * => $v } }

    cs_commit { 'puppet': }

}
