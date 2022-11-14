from locust import HttpUser, task

class EpochMaker(HttpUser):
    @task
    def hello_world(self):
        self.client.post("/epoch")