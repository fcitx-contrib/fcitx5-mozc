set -e

PYTHONPATH=. python dictionary/gen_pos_cost_map.py --user_pos_file data/rules/user_pos.def --output $1
