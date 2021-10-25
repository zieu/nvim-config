import foo from "./foo";

console.log(foo("12"));

type hello = {
    abcd: "hello" | "hello2";
    abc?: number;
}

const obj: hello = {
    abcd: "hello",
}
