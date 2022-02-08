import argparse

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--doit", action="store_true", help="Example argument: Do the thing.")
    args = parser.parse_args()

    return args

def main():
    args = parse_args()

    if args.doit:
        print("Doing the thing.")
