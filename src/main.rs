use azalea::prelude::*;
use parking_lot::Mutex;
use std::{
    env::var,
    sync::Arc
};


#[tokio::main(flavor = "current_thread")]
async fn main() {
    let host = var("MIXBOT_HOST").unwrap_or("localhost".to_string());
    let name = var("MIXBOT_NAME").unwrap_or("MiXBot".to_string());
    let online = var("MIXBOT_ONLINE").unwrap_or("false".to_string());

    let account = if online == "1" || online == "true" {
        Account::microsoft(&name).await.unwrap()
    } else {
        Account::offline(&name)
    };

    ClientBuilder::new()
        .set_handler(handle)
        .start(account, host)
        .await
        .unwrap();
}

#[derive(Default, Clone, Component)]
pub struct State {
    pub messages_received: Arc<Mutex<usize>>
}

async fn handle(_bot: Client, event: Event, state: State) -> anyhow::Result<()> {
    match event {
        Event::Chat(m) => {
            println!("{}", m.message().to_ansi());
            *state.messages_received.lock() += 1;
        }
        _ => {}
    }

    Ok(())
}
