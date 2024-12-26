python build_tools/mozc_version.py --template_path data/version/mozc_version_template.bzl --target_platform=Mac --output $1
PYTHONPATH=. python build_tools/replace_version.py --version_file $1 --branding Mozc --input base/version_def_template.h --output $2
