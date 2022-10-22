mod api;
mod components;
mod pages;
mod types;
mod app;
mod route;

fn main() {
            println!{"{}", "hello"};
}

use wasm_bindegen::prelude::*;
use yew::prelude::*;

#[wasm_bindgen(start)]
pub fn run_app() {
    wasm_logger::init(wasm_logger::Config::default());
    App::<app::App>::new.mount_to_body();
}
