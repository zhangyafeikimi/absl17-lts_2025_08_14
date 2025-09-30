# buildifier: disable=module-docstring
load(
    "@rules_cc//cc:defs.bzl",
    "cc_library",
)

COPTS = [
    "-std=c++17",
    "-w",
    "-pthread",
]

LINKOPTS = [
    "-pthread",
]

def absl17_cc_library(
        name,
        srcs = [],
        hdrs = [],
        copts = [],
        includes = [],
        linkopts = [],
        visibility = [
            "//visibility:public",
        ],
        deps = [],
        **kwargs):
    # buildifier: disable=native-cc-library
    cc_library(
        name = name,
        srcs = srcs,
        hdrs = hdrs,
        copts = COPTS + copts,
        includes = includes,
        linkopts = LINKOPTS + linkopts,
        linkstatic = True,
        visibility = visibility,
        deps = deps,
        **kwargs
    )
