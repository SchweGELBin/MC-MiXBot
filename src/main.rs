//! A bot that logs chat messages sent in the server to the console.

use std::sync::Arc;

use azalea::prelude::*;
use parking_lot::Mutex;

#[tokio::main]
async fn main() {
    let account = Account::offline("bot");
    // or Account::microsoft("example@example.com").await.unwrap();

    ClientBuilder::new()
        .set_handler(handle)
        .start(account, "localhost")
        .await
        .unwrap();
}

#[derive(Default, Clone, Component)]
pub struct State {
    pub messages_received: Arc<Mutex<usize>>
}

async fn handle(bot: Client, event: Event, state: State) -> anyhow::Result<()> {
    match event {
        Event::Chat(m) => {
            println!("{}", m.message().to_ansi());
            *state.messages_received.lock() += 1;
        }
        _ => {}
    }

    Ok(())
}
