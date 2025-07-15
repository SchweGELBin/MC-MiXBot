mod discord;
mod minecraft;

#[tokio::main]
async fn main() {
    discord::start().await;
}
