import logging

def setup_logging():
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        handlers=[
            #logging.FileHandler("app.log"),   # write logs to file
            logging.StreamHandler()           # also print to console
        ]
    )
