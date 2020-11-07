use rustler::{Encoder, Env, Error, Term};

mod atoms {
    // 生成されるコードでは rustler_atoms! となっているが、
    // cannot find macro `rustler_atoms` in this scope というエラーが出るため、絶対パスで参照するように変更する。
    rustler::rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler::rustler_export_nifs! {
    "Elixir.NifExample",
    [
        ("add", 2, add)
    ],
    None
}

fn add<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let num1: i64 = args[0].decode()?;
    let num2: i64 = args[1].decode()?;

    Ok((atoms::ok(), num1 + num2).encode(env))
}
