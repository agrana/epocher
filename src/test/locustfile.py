from locust import HttpUser, task


class EpochMaker(HttpUser):
    @task
    def main_path(self):
        self.client.post("/epoch")
