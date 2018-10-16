# Wrapper for the puppet/corosync module

class cswrap(
    $clones = {},
    $colocations = {},
    $groups = {},
    $locations = {},
    $orders = {},
    $primitives = {},
    $properties = {},
    $rsc_defaults = {},
) {

    include corosync

    file { 'fence_dummy':
        path   => '/usr/sbin/fence_dummy',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        source => 'puppet:///modules/cswrap/fence_dummy',
    }

    # Defaults
    $d = { cib => 'puppet' }

    cs_shadow { 'puppet': }

    $primitives.each   |$k, $v| { cs_primitive    { $k: * => $d + $v } }

    $groups.each       |$k, $v| { cs_group        { $k: * => $d + $v } }

    $locations.each    |$k, $v| { cs_location     { $k: * => $d + $v } }

    $colocations.each  |$k, $v| { cs_colocation   { $k: * => $d + $v } }

    $orders.each       |$k, $v| { cs_order        { $k: * => $d + $v } }

    $clones.each       |$k, $v| { cs_clone        { $k: * => $d + $v } }

    $properties.each   |$k, $v| { cs_property     { $k: * => $d + $v } }

    $rsc_defaults.each |$k, $v| { cs_rsc_defaults { $k: * => $d + $v } }

    cs_commit { 'puppet': }

}
